import 'package:dartz/dartz.dart';
import 'package:layout_task/core/errors/failure.dart';
import 'package:layout_task/features/domain/entities/task.dart';
import 'package:layout_task/features/domain/repository/task_repository.dart';

class ViewAllTasks {
  final TaskRepository taskRepository;

  ViewAllTasks(this.taskRepository);

  Future<Either<Failure, List<TodoTask>>> execute() async {
    return await taskRepository.viewAllTasks();
  }
}
