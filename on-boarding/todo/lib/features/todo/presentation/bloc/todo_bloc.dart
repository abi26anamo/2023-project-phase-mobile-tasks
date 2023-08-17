import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_task/features/todo/presentation/bloc/todo_events.dart';
import 'package:layout_task/features/todo/presentation/bloc/todo_states.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/create_task_usecase.dart';
import '../../domain/usecases/delete_task_usecase.dart';
import '../../domain/usecases/update_task_usecase.dart';
import '../../domain/usecases/view_all_task_usecase.dart';
import '../../domain/usecases/view_single_task.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final CreateTodoTask createTodoTask;
  final ViewAllTasks viewAllTasks;
  final UpdateTodoTask updateTodoTask;
  final DeleteTodoTask deleteTodoTask;
  final ViewTask viewTask;

  TodoBloc({
    required this.createTodoTask,
    required this.viewAllTasks,
    required this.updateTodoTask,
    required this.deleteTodoTask,
    required this.viewTask,
  }) : super(Initial());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is CreateTaskEvent) {
      yield Loading();
      final result =
          await createTodoTask(CreateTodoParams(task: event.todoTask));
      yield* result.fold(
        (failure) async* {
          Error(message: _mapFailureToMessage(failure));
        },
        (task) async* {
          Created(todoTask: task);
        },
      );
    } else if (event is ViewAllTasks) {
      yield Loading();

      final result = await viewAllTasks(NoParams());

      yield* result.fold(
        (failure) async* {
          Error(message: _mapFailureToMessage(failure));
        },
        (tasks) async* {
          ViewAll(todoTasks: tasks);
        },
      );
    } else if (event is ViewOneTask) {
      yield Loading();

      final result = await viewTask(Params(id: event.id));

      yield* result.fold(
        (failure) async* {
          Error(message: _mapFailureToMessage(failure));
        },
        (task) async* {
          ViewOne(todoTask: task);
        },
      );
    } else if (event is UpdateTaskEvent) {
      yield Loading();

      final result = await updateTodoTask(Params(id: event.id));

      yield* result.fold(
        (failure) async* {
          Error(message: _mapFailureToMessage(failure));
        },
        (task) async* {
          Updated(todoTask: task);
        },
      );
    } else if (event is DeleteTaskEvent) {
      yield Loading();

      final result = await deleteTodoTask(Params(id: event.id));

      yield* result.fold(
        (failure) async* {
          Error(message: _mapFailureToMessage(failure));
        },
        (task) async* {
          Deleted();
        },
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;

      default:
        return 'Unexpected Error';
    }
  }
}
