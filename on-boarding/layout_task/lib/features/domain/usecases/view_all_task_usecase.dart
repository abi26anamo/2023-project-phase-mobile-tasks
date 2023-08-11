import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:layout_task/core/errors/failure.dart';
import 'package:layout_task/core/usecases/usecase.dart';
import 'package:layout_task/features/domain/entities/task.dart';
import 'package:layout_task/features/domain/repository/task_repository.dart';

class ViewAllTasks extends Usecase<List<TodoTask>, NoParams>{
  final TaskRepository taskRepository;

  ViewAllTasks(this.taskRepository);

  
  @override
  Future<Either<Failure, List<TodoTask>>> call(NoParams params) async{
    return await taskRepository.viewAllTasks();
  }
}
