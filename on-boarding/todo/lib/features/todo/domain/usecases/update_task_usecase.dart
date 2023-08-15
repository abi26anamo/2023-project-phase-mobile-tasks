import 'package:layout_task/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:layout_task/features/todo/domain/entities/task.dart';
import 'package:layout_task/features/todo/domain/repository/task_repository.dart';
import 'package:layout_task/features/todo/domain/usecases/view_single_task.dart';

import '../../../../core/usecases/usecase.dart';

class UpdateTodoTask extends Usecase<void, Params> {
  final TaskRepository taskRepository;

  UpdateTodoTask(this.taskRepository);

  @override
  Future<Either<Failure, TodoTask>> call(Params params) async {
    return await taskRepository.updateTask(params.id);
  }
}
