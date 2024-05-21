part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class GetAllTasksEvent extends TaskEvent {
  final TasksRequestParams tasksRequestParams;
  const GetAllTasksEvent(this.tasksRequestParams);
  @override
  List<Object> get props => [];
}

class GetMyTasksEvent extends TaskEvent {
  final MyTasksRequestParams myTasksRequestParams;
  const GetMyTasksEvent(this.myTasksRequestParams);
  @override
  List<Object> get props => [];
}

class AddTaskEvent extends TaskEvent {
  final AddTodoParam addTodoParam;
  const AddTaskEvent(this.addTodoParam);
  @override
  List<Object> get props => [];
}

class UpdateTaskEvent extends TaskEvent {
  final UpdateTodoParam updateTodoParam;
  const UpdateTaskEvent(this.updateTodoParam);
  @override
  List<Object> get props => [];
}


class DeleteTaskEvent extends TaskEvent {
  final DeleteTodoParam deleteTodoParam;
  const DeleteTaskEvent(this.deleteTodoParam);
  @override
  List<Object> get props => [];
}
