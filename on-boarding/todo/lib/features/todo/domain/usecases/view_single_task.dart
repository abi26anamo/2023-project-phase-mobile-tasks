import 'package:dartz/dartz.dart';
import 'package:layout_task/core/errors/failure.dart';
import 'package:layout_task/features/todo/domain/entities/task.dart';
import 'package:layout_task/features/todo/domain/repository/task_repository.dart';

import '../../../../core/usecases/usecase.dart';

class ViewTask extends Usecase<TodoTask, Params> {
  final TaskRepository taskRepository;

  ViewTask(this.taskRepository);

  
  @override
  Future<Either<Failure, TodoTask>> call(Params params) async{
   return await taskRepository.getTask(params.id);
  }
}

class Params {
  final String id;
  Params({required this.id});
}
