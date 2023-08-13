import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/task.dart';
import '../../domain/repository/task_repository.dart';
import '../datasources/task_local_data_source.dart';
import '../datasources/task_remote_data_source.dart';
import '../models/todo_model.dart';

class ServerException implements Exception {}

class CacheException implements Exception {}

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;
  final TaskLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  TaskRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, TodoTask>> viewTask(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTask = await remoteDataSource.ViewTask(id);
        localDataSource.cacheTask(remoteTask);

        return Right(remoteTask);
      } on ServerException {
        return Left(ServerFailure());
      } catch (_) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTask = await localDataSource.getLastTask();
        return Right(localTask);
      } on CacheException {
        return Left(CacheFailure());
      } catch (_) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<TodoTask>>> viewAllTask() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTasks = await remoteDataSource.ViewAllTasks();
        localDataSource.cacheAllTask(remoteTasks);

        return Right(remoteTasks);
      } on ServerException {
        return Left(ServerFailure());
      } catch (_) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTasks = await localDataSource.getAllCachedTasks();
        return Right(localTasks);
      } on CacheException {
        return Left(CacheFailure());
      } catch (_) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, TodoTask>> createTask(TodoTask task) async {
    if (await networkInfo.isConnected) {
      try {
        final todoModel = TodoModel(
          id: task.id,
          text: task.text,
          title: task.title,
          subtitle: task.subtitle,
          date: task.date,
        );

        final createdTask = await remoteDataSource.CreateTask(todoModel);
        localDataSource.cacheTask(createdTask);

        return Right(createdTask);
      } on ServerException {
        return Left(ServerFailure());
      } catch (_) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
