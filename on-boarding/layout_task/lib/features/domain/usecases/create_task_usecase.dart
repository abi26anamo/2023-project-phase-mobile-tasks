import 'package:dartz/dartz.dart';
import 'package:layout_task/core/errors/failure.dart';
import 'package:layout_task/features/domain/entities/task.dart';
import 'package:layout_task/features/domain/repository/task_repository.dart';

class CreateTodoTask {
  final TaskRepository  taskRepository;

  CreateTodoTask(this.taskRepository);

  Future<Either<Failure,TodoTask>>execute(TodoTask task) async{
    return await taskRepository.createTask(task);
  }
}       