import 'package:layout_task/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:layout_task/core/usecases/usecase.dart';
import 'package:layout_task/features/todo/domain/repository/task_repository.dart';
import 'package:layout_task/features/todo/domain/usecases/view_single_task.dart';

class DeleteTodoTask extends Usecase<void,Params>{
  final TaskRepository taskRepository;

  DeleteTodoTask(this.taskRepository);
  
  @override
  Future<Either<Failure, void>> call(Params params)async {
    return await taskRepository.deleteTask(params.id);
  
  }
}   