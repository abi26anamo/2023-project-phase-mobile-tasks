import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/create_task_usecase.dart';
import '../../domain/usecases/delete_task_usecase.dart';
import '../../domain/usecases/update_task_usecase.dart';
import '../../domain/usecases/view_all_task_usecase.dart';
import '../../domain/usecases/view_single_task.dart';
import 'todo_events.dart';
import 'todo_states.dart';

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
  }) : super(Initial()) {
    on<CreateTaskEvent>(_onCreateTodoTask);
    on<UpdateTaskEvent>(_onUpdateTodoTask);
    on<DeleteTaskEvent>(_onDeleteTodoTask);
    on<ViewOneTask>(_onViewTodoTask);
    on<ViewAllTasksEvent>(_onViewAllTodoTask);
  }

  void _onCreateTodoTask(CreateTaskEvent event, Emitter<TodoState> emit) async {
    emit(Loading());

    final result = await createTodoTask(CreateTodoParams(task: event.todoTask));

    result.fold(
      (failure) => emit(Error(message: _mapFailureToMessage(failure))),
      (task) => emit(Created(todoTask: task)),
    );
  }

  void _onUpdateTodoTask(UpdateTaskEvent event, Emitter<TodoState> emit) async {
    emit(Loading());
    final result = await updateTodoTask(Params(id: event.id));
    result.fold(
      (failure) => emit(Error(message: _mapFailureToMessage(failure))),
      (task) => emit(Updated(todoTask: task)),
    );
  }

  void _onDeleteTodoTask(DeleteTaskEvent event, Emitter<TodoState> emit) async {
    emit(Loading());
    final result = await deleteTodoTask(Params(id: event.id));
    result.fold(
      (failure) => emit(Error(message: _mapFailureToMessage(failure))),
      (task) => emit(Deleted()),
    );
  }

  void _onViewTodoTask(ViewOneTask event, Emitter<TodoState> emit) async {
    emit(Loading());
    final result = await viewTask(Params(id: event.id));
    result.fold(
      (failure) => emit(Error(message: _mapFailureToMessage(failure))),
      (task) => emit(ViewOne(todoTask: task)),
    );
  }

  void _onViewAllTodoTask(
      ViewAllTasksEvent event, Emitter<TodoState> emit) async {
    emit(Loading());
    final result = await viewAllTasks(NoParams());
    result.fold(
      (failure) => emit(Error(message: _mapFailureToMessage(failure))),
      (task) => emit(ViewAll(todoTasks: task)),
    );
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
