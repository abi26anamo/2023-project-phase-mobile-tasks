import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_task/features/domain/entities/task.dart';
import 'package:layout_task/features/domain/repository/task_repository.dart';
import 'package:layout_task/features/domain/usecases/view_single_task.dart';
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
    color: Colors.white,
  );
  test("should get a task from the respository", () async {
    when(mockTaskRepository.viewTask(1))
        .thenAnswer((_) async => Right(tTodoTask));

    final result = await viewTaskUsecase.call(Params(id: 1));

    expect(result, tTodoTask);
    verify(mockTaskRepository.viewTask(1));
    verifyNoMoreInteractions(mockTaskRepository);
  });
}
