part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object> get props => [];
}
///Get All Tasks
class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskSuccess extends TaskState {
  final TasksEntity data;
  const TaskSuccess({required this.data});
  @override
  List<Object> get props => [data];
}

class TaskError extends TaskState {
  final String textError;
  const TaskError({required this.textError});

  @override
  List<Object> get props => [textError];
}

///Get User Tasks

class MyTaskInitial extends TaskState {}

class MyTaskLoading extends TaskState {}

class MyTaskSuccess extends TaskState {
  final TasksEntity data;
  const MyTaskSuccess({required this.data});
  @override
  List<Object> get props => [data];
}

class MyTaskError extends TaskState {
  final String textError;
  const MyTaskError({required this.textError});

  @override
  List<Object> get props => [textError];
}

///Add User Task

class AddTaskInitial extends TaskState {}

class AddTaskLoading extends TaskState {}

class AddTaskSuccess extends TaskState {
  final AddTasksEntity data;
  const AddTaskSuccess({required this.data});
  @override
  List<Object> get props => [data];
}

class AddTaskError extends TaskState {
  final String textError;
  const AddTaskError({required this.textError});

  @override
  List<Object> get props => [textError];
}

///Update User Task

class UpdateTaskInitial extends TaskState {}

class UpdateTaskLoading extends TaskState {}

class UpdateTaskSuccess extends TaskState {
  final UpdateTasksEntity data;
  const UpdateTaskSuccess({required this.data});
  @override
  List<Object> get props => [data];
}

class UpdateTaskError extends TaskState {
  final String textError;
  const UpdateTaskError({required this.textError});

  @override
  List<Object> get props => [textError];
}

///
///Update User Task

class DeleteTaskInitial extends TaskState {}

class DeleteTaskLoading extends TaskState {}

class DeleteTaskSuccess extends TaskState {
  final DeleteTasksEntity data;
  const DeleteTaskSuccess({required this.data});
  @override
  List<Object> get props => [data];
}

class DeleteTaskError extends TaskState {
  final String textError;
  const DeleteTaskError({required this.textError});

  @override
  List<Object> get props => [textError];
}
