import 'package:dartz/dartz.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_task/core/errors/failure.dart';
import 'package:layout_task/features/todo/domain/entities/task.dart';
import 'package:layout_task/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:layout_task/features/todo/presentation/bloc/todo_events.dart';
import 'package:layout_task/features/todo/presentation/bloc/todo_states.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/mock_create_todotask.mocks.dart';
import '../../helpers/mock_delete_task.mocks.dart';
import '../../helpers/mock_update_task.mocks.dart';
import '../../helpers/mock_view_all_tasks.mocks.dart';
import '../../helpers/mock_viewtask.mocks.dart';

void main() {
  late TodoBloc bloc;
  late MockCreateTodoTask mockCreateTodoTask;
  late MockViewAllTasks mockViewAllTasks;
  late MockViewTask mockViewTask;
  late MockDeleteTodoTask mockDeleteTodoTask;
  late MockUpdateTodoTask mockUpdateTodoTask;

  setUp(() {
    mockCreateTodoTask = MockCreateTodoTask();
    mockViewAllTasks = MockViewAllTasks();
    mockViewTask = MockViewTask();
    mockDeleteTodoTask = MockDeleteTodoTask();
    mockUpdateTodoTask = MockUpdateTodoTask();

    bloc = TodoBloc(
      createTodoTask: mockCreateTodoTask,
      viewAllTasks: mockViewAllTasks,
      updateTodoTask: mockUpdateTodoTask,
      deleteTodoTask: mockDeleteTodoTask,
      viewTask: mockViewTask,
    );
  });

  blocTest("should return Initial for initial state",
      build: () {
        return bloc;
      },
      expect: () => Initial());

  group("CreateTodoTask", () {
    final tTodoTask = TodoTask(
        id: "1",
        title: "title",
        subtitle: "subtitle",
        text: "description",
        date: "12/12/12");

    blocTest<TodoBloc, TodoState>(
      "should emit [Loading, Created] when the usecase returns a TodoTask",
      build: () {
        when(mockCreateTodoTask(any)).thenAnswer((_) async => Right(tTodoTask));
        return bloc;
      },
      act: (bloc) => bloc.add(CreateTaskEvent(todoTask: tTodoTask)),
      expect: () => [
        Loading(),
        Created(todoTask: tTodoTask),
      ],
    );

    blocTest<TodoBloc, TodoState>(
      "should emit [Loading, Error] when the usecase returns a Failure",
      build: () {
        when(mockCreateTodoTask(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        return bloc;
      },
      act: (bloc) => bloc.add(CreateTaskEvent(todoTask: tTodoTask)),
      expect: () => [
        Loading(),
        Error(message: SERVER_FAILURE_MESSAGE),
      ],
    );
  });

  group("update todo task", () {});
}
