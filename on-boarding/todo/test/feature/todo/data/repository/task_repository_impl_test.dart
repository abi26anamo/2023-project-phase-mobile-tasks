import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_task/core/errors/failure.dart';
import 'package:layout_task/features/todo/data/datasources/task_local_data_source.dart';
import 'package:layout_task/features/todo/data/datasources/task_remote_data_source.dart';
import 'package:layout_task/features/todo/data/models/todo_model.dart';
import 'package:layout_task/features/todo/data/repository/task_repository_Impl.dart';
import 'package:layout_task/features/todo/domain/entities/task.dart';
import 'package:mockito/mockito.dart';
import 'package:layout_task/core/network/network_info.dart';

class MockRemoteDataSource extends Mock implements TaskRemoteDataSource {}

class MockLocalDataSource extends Mock implements TaskLocalDataSource {}

class MOckNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late TaskRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MOckNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MOckNetworkInfo();
    repository = TaskRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group("viewtask", () {
    final tId = 1;
    final tTaskModel = TodoModel(
        id: "1",
        text: "text",
        title: "title",
        subtitle: "subtitle",
        date: "date");

    final TodoTask tTask = tTaskModel;

    test("should check if the device is online", () {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      repository.getTask(tId);
      verify(mockNetworkInfo.isConnected);
    });

    group("device is online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test("should return remote data", () async {
        when(mockRemoteDataSource.getTask(tId))
            .thenAnswer((_) async => tTaskModel);
        final result = await repository.getTask(tId);
        verify(mockRemoteDataSource.getTask(tId));
        expect(result, equals(Right(tTask)));
      });

      test("should cache remote data locally", () {
        when(mockRemoteDataSource.getTask(tId))
            .thenAnswer((_) async => tTaskModel);
        repository.getTask(tId);
        verify(mockRemoteDataSource.getTask(tId));
        verify(mockLocalDataSource.cacheTask(tTaskModel));
      });

      test(
          "should return serverfailure when call to remote data is unsecessful",
          () {
        when(mockRemoteDataSource.getTask(tId)).thenThrow(ServerException());
        final result = repository.getTask(tId);
        verify(mockRemoteDataSource.getTask(tId));
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group("device is offline", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test("should return last locally cached data when cached data is present",
          () async {
        when(mockLocalDataSource.getTask())
            .thenAnswer((_) async => tTaskModel);
        final result = await repository.getTask(tId);
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getTask());
        expect(result, equals(Right(tTask)));
      });

      test("should return cache failure when there is no cached data present",
          () async {
        when(mockLocalDataSource.getTask()).thenThrow(CacheException());
        final result = await repository.getTask(tId);
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getTask());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}
