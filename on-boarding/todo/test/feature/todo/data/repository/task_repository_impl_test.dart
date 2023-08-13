import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_task/core/errors/failure.dart';
import 'package:layout_task/core/platform/network_info.dart';
import 'package:layout_task/features/todo/data/datasources/task_local_data_source.dart';
import 'package:layout_task/features/todo/data/datasources/task_remote_data_source.dart';
import 'package:layout_task/features/todo/data/models/todo_model.dart';
import 'package:layout_task/features/todo/data/repository/task_repository_Impl.dart';
import 'package:layout_task/features/todo/domain/entities/task.dart';
import 'package:mockito/mockito.dart';

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
      repository.viewTask(tId);
      verify(mockNetworkInfo.isConnected);
    });

    group("device is online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test("should return remote data", () async {
        when(mockRemoteDataSource.ViewTask(any))
            .thenAnswer((_) async => tTaskModel);
        final result = await repository.viewTask(tId);
        verify(mockRemoteDataSource.ViewTask(tId));
        expect(result, equals(Right(tTask)));
      });

      test("should cache remote data locally", () {
        when(mockRemoteDataSource.ViewTask(any))
            .thenAnswer((_) async => tTaskModel);
        repository.viewTask(tId);
        verify(mockRemoteDataSource.ViewTask(tId));
        verify(mockLocalDataSource.cacheTask(tTaskModel));
      });

      test(
          "should return serverfailure when call to remote data is unsecessful",
          () {
        when(mockRemoteDataSource.ViewTask(any)).thenThrow(ServerException());
        final result = repository.viewTask(tId);
        verify(mockRemoteDataSource.ViewTask(tId));
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
        when(mockLocalDataSource.getLastTask())
            .thenAnswer((_) async => tTaskModel);
        final result = await repository.viewTask(tId);
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastTask());
        expect(result, equals(Right(tTask)));
      });

      test("should return cache failure when there is no cached data present",
          () async {
        when(mockLocalDataSource.getLastTask()).thenThrow(CacheException());
        final result = await repository.viewTask(tId);
        verifyZeroInteractions(mockRemoteDataSource);
        verify(mockLocalDataSource.getLastTask());
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}
