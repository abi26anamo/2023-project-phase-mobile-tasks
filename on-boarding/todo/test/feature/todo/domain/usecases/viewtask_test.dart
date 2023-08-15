import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_task/features/todo/domain/entities/task.dart';
import 'package:layout_task/features/todo/domain/repository/task_repository.dart';
import 'package:layout_task/features/todo/domain/usecases/view_single_task.dart';
import 'package:mockito/mockito.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late ViewTask viewTaskUsecase;
  late MockTaskRepository mockTaskRepository;
  setUp(() {
    mockTaskRepository = MockTaskRepository();
    viewTaskUsecase = ViewTask(mockTaskRepository);
  });

  final tTodoTask = TodoTask(
    id: "1",
    text: "test text",
    title: "test",
    subtitle: "ui design",
    date: "12/7/2023",
  );
  test("should get a task from the respository", () async {
    when(mockTaskRepository.getTask(1))
        .thenAnswer((_) async => Right(tTodoTask));

    final result = await viewTaskUsecase(Params(id: 1));

    expect(result, tTodoTask);
    verify(mockTaskRepository.getTask(1));
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
