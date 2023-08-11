import 'package:dartz/dartz.dart';
import 'package:layout_task/core/errors/failure.dart';
import 'package:layout_task/features/domain/entities/task.dart';
import 'package:layout_task/features/domain/repository/task_repository.dart';

import '../../../core/usecases/usecase.dart';

class ViewTask extends Usecase<TodoTask, Params> {
  final TaskRepository taskRepository;

  ViewTask(this.taskRepository);

  
  @override
  Future<Either<Failure, TodoTask>> call(Params params) async{
   return await taskRepository.viewTask(params.id);
  }
}

class Params {
  final int id;
  Params({required this.id});
}
