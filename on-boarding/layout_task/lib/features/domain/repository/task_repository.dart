import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../entities/task.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<TodoTask>>> viewAllTasks();
  Future<Either<Failure, TodoTask>> viewTask(int id);
  Future<Either<Failure, TodoTask>> createTask(TodoTask task);
}
