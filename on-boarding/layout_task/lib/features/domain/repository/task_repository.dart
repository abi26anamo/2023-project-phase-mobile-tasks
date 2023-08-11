
import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/task.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TodoTask>>> getTasks();
  Future<Either<Failure, TodoTask>> getTask(int id);
  Future<Either<Failure, TodoTask>> createTask(TodoTask task);
  Future<Either<Failure, void>> updateTask(TodoTask task);
  Future<Either<Failure, void>> deleteTask(int id);
}