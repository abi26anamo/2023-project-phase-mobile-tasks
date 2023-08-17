import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:layout_task/features/todo/domain/entities/task.dart';
import 'package:layout_task/features/todo/domain/usecases/create_task_usecase.dart';
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

  test("the initial state has to be Initial", () async {
    expect(bloc.state, Initial());
  });

  group("CreateTodoTask", () {
    test("should return Created when the task is created", () async {
      final todoTask = TodoTask(
        id: "1",
        title: "title",
        subtitle: "description",
        text: "test text",
        isCompleted: false,
        date: "12/22/12",
      );
      when(mockCreateTodoTask(any)).thenAnswer((_) async => Right(todoTask));
      bloc.add(CreateTaskEvent(todoTask: todoTask));
      await untilCalled(mockCreateTodoTask(any));
      verify(mockCreateTodoTask(CreateTodoParams(task: todoTask)));
      expect(bloc.state, Created(todoTask: todoTask));
    });
  });
}
