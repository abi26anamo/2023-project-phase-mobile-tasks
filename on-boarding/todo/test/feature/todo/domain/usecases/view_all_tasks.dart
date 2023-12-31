import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_task/core/usecases/usecase.dart';
import 'package:layout_task/features/todo/domain/entities/task.dart';
import 'package:layout_task/features/todo/domain/repository/task_repository.dart';
import 'package:layout_task/features/todo/domain/usecases/view_all_task_usecase.dart';
import 'package:mockito/mockito.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late ViewAllTasks viewAllTasksUsecase;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    viewAllTasksUsecase = ViewAllTasks(mockTaskRepository);
  });

  test("should get all the tasks from the repository", () async {
    final tTodoTask = TodoTask(
      id: "1",
      text: "test text",
      title: "test",
      subtitle: "ui design",
      date: "12/7/2023",
    );
    final tTodoTaskList = [tTodoTask];
    when(mockTaskRepository.getAllTasks())
        .thenAnswer((_) async => Right(tTodoTaskList));

    final result = await viewAllTasksUsecase(NoParams());

    expect(result, tTodoTaskList);

    verify(mockTaskRepository.getAllTasks());
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
