import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_task/features/domain/entities/task.dart';
import 'package:layout_task/features/domain/repository/task_repository.dart';
import 'package:layout_task/features/domain/usecases/create_task_usecase.dart';
import 'package:mockito/mockito.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

void main() {
  late CreateTodoTask createTodoTask;
  late MockTaskRepository mockTaskRepository;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    createTodoTask = CreateTodoTask(mockTaskRepository);
  });

  test("create task use case", () async {
    final task = TodoTask(
      id: "1",
      text: "text",
      title: "title",
      subtitle: "subtitle",
      date: "date",
      color: Colors.white,
    );

    when(mockTaskRepository.createTask(task))
        .thenAnswer((_) async => Right(task));

    final result = await createTodoTask.call(Params(task: task));

    expect(result, task);
  });
}
