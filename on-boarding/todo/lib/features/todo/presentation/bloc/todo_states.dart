import 'package:equatable/equatable.dart';
import 'package:layout_task/features/todo/domain/entities/task.dart';

class TodoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Initial extends TodoState {}

class Loading extends TodoState {}

class Created extends TodoState {
  final TodoTask todoTask;

  Created({required this.todoTask});

  @override
  List<Object?> get props => [todoTask];
}

class Updated extends TodoState {
  final TodoTask todoTask;

  Updated({required this.todoTask});

  @override
  List<Object?> get props => [todoTask];
}

class Deleted extends TodoState {}

class ViewAll extends TodoState {
  final List<TodoTask> todoTasks;

  ViewAll({required this.todoTasks});

  @override
  List<Object?> get props => [todoTasks];
}

class ViewOne extends TodoState {
  final TodoTask todoTask;

  ViewOne({required this.todoTask});

  @override
  List<Object?> get props => [todoTask];
}

class Error extends TodoState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [message];
}
