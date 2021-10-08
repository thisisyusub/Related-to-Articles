import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'task.dart';

@immutable
abstract class TaskState extends Equatable {
  @override
  List<Object> get props => [];
}

class TaskLoadInitial extends TaskState {}

class TaskLoadInProgress extends TaskState {}

class TaskLoadSuccess extends TaskState {
  TaskLoadSuccess(this.tasks);

  final List<Task> tasks;

  @override
  List<Object> get props => [...tasks];
}

class TaskLoadFailure extends TaskState {}
