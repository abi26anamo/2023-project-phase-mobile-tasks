import 'package:dartz/dartz.dart';
import 'package:layout_task/core/errors/failure.dart';
import 'package:layout_task/core/usecases/usecase.dart';
import 'package:layout_task/features/todo/domain/entities/task.dart';
import 'package:layout_task/features/todo/domain/repository/task_repository.dart';

class CreateTodoTask extends Usecase<TodoTask, Params>{
  final TaskRepository  taskRepository;

  CreateTodoTask(this.taskRepository);
  
  @override
  Future<Either<Failure, TodoTask>> call(Params params) async {
   return await taskRepository.createTask(params.task);
  }
}       

class Params {
  final TodoTask task;
  Params({required this.task});
}   