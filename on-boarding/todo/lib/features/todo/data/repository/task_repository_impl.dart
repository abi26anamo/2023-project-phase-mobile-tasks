import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/task.dart';
import '../../domain/repository/task_repository.dart';
import '../datasources/task_local_data_source.dart';
import '../datasources/task_remote_data_source.dart';
import '../models/todo_model.dart';
import '../../../../core/network/network_info.dart';

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
  Future<Either<Failure, TodoTask>> getTask(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTask = await remoteDataSource.getTask(id);
        localDataSource.cacheTask(remoteTask);

        return Right(remoteTask);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTask = await localDataSource.getTask();
        return Right(localTask);
      } on CacheException {
        return Left(CacheFailure());
      } catch (_) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<TodoTask>>> getAllTasks() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTasks = await remoteDataSource.getAllTasks();
        localDataSource.cacheAllTask(remoteTasks);

        return Right(remoteTasks);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTasks = await localDataSource.getAllCachedTasks();
        return Right(localTasks);
      } on CacheException {
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

        final createdTask = await remoteDataSource.createTask(todoModel);
        localDataSource.cacheTask(createdTask);

        return Right(createdTask);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(int id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteTask(id);
        localDataSource.deleteCachedTask(id);

        return Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TodoTask>> updateTask(int id) async {
    if (await networkInfo.isConnected) {
      try {
        final updatedTask = await remoteDataSource.updateTask(id);
        localDataSource.cacheTask(updatedTask);

        return Right(updatedTask);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
