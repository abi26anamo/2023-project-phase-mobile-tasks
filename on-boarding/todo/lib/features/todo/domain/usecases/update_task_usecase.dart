import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/task.dart';
import '../repository/task_repository.dart';
import 'view_single_task.dart';

class UpdateTodoTask extends Usecase<void, Params> {
  final TaskRepository taskRepository;

  UpdateTodoTask(this.taskRepository);

  @override
  Future<Either<Failure, TodoTask>> call(Params params) async {
    return await taskRepository.updateTask(params.id);
  }
}
