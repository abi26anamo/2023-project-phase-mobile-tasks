import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/task.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TodoTask>>> getAllTasks();
  Future<Either<Failure, TodoTask>> getTask(int id);
  Future<Either<Failure, TodoTask>> createTask(TodoTask task);
  Future<Either<Failure, TodoTask>> updateTask(int id);
  Future<Either<Failure, void>> deleteTask(int id);
}
