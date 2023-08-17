import 'package:equatable/equatable.dart';

import '../../domain/entities/task.dart';

class TodoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CreateTaskEvent extends TodoEvent {
  final TodoTask todoTask;

  CreateTaskEvent({required this.todoTask});

  @override
  List<Object?> get props => [todoTask];
}

class ViewOneTask extends TodoEvent {
  final String id;

  ViewOneTask({required this.id});

  @override
  List<Object?> get props => [id];
}

class ViewAllTasksEvent extends TodoEvent {}

class UpdateTaskEvent extends TodoEvent {
  final String id;

  UpdateTaskEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeleteTaskEvent extends TodoEvent {
  final String id;

  DeleteTaskEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
