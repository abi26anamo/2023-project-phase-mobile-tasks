import 'package:dartz/dartz.dart';
import 'package:layout_task/core/errors/failure.dart';
import 'package:layout_task/features/domain/entities/task.dart';
import 'package:layout_task/features/domain/repository/task_repository.dart';

class GetTodoTask{
 final TaskRepository taskRepository; 

 GetTodoTask(this.taskRepository); 


Future<Either<Failure,TodoTask>> execute(int id) async{
  return await taskRepository.getTask(id);
} 

}   