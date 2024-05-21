import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/add_task_model.dart';
import '../../../data/model/delete_task_model.dart';
import '../../../data/model/task_model.dart';
import '../../../data/model/update_task_model.dart';
import '../../../data/repositories/tasks_repository.dart';
import '../../../domain/entities/add_tasks_entity.dart';
import '../../../domain/entities/delete_tasks_entity.dart';
import '../../../domain/entities/tasks_entity.dart';
import '../../../domain/entities/update_tasks_entity.dart';
import '../../../domain/usecases/add_task_usecase.dart';
import '../../../domain/usecases/delete_task_usecase.dart';
import '../../../domain/usecases/get_all_tasks_usecase.dart';
import '../../../domain/usecases/get_my_tasks_usecase.dart';
import '../../../domain/usecases/update_task_usecase.dart';
import '../../../utils/injection_container.dart';
import '../../../utils/shared_Preferences.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<GetAllTasksEvent>(_allTaskEventHandler);
    on<GetMyTasksEvent>(_myTaskEventHandler);
    on<AddTaskEvent>(_addTaskEventHandler);
    on<UpdateTaskEvent>(_updateTaskEventHandler);
    on<DeleteTaskEvent>(_deleteTaskEventHandler);
  }

  _allTaskEventHandler(
      GetAllTasksEvent event, Emitter<TaskState> emit) async {
    try {
      emit(TaskLoading());
      TasksEntity entity = await GetAllTasksUseCase(sl<TasksRepositoryImp>()).getAllTasks(event.tasksRequestParams);

      emit(TaskSuccess(data: entity));
    } catch (e) {
      emit(TaskError(textError: e.toString()));
    }
  }

  _myTaskEventHandler(
      GetMyTasksEvent event, Emitter<TaskState> emit) async {
    try {
      emit(MyTaskLoading());
      TasksEntity entity = await GetMyTasksUseCase(sl<TasksRepositoryImp>()).getMyTasks(event.myTasksRequestParams);

      emit(MyTaskSuccess(data: entity));
    } catch (e) {
      emit(MyTaskError(textError: e.toString()));
    }
  }

  _addTaskEventHandler(
      AddTaskEvent event, Emitter<TaskState> emit) async {
    try {
      emit(AddTaskLoading());
      AddTasksEntity entity = await AddTasksUseCase(sl<TasksRepositoryImp>()).addTask(event.addTodoParam);
      emit(AddTaskSuccess(data: entity));
    } catch (e) {
      emit(AddTaskError(textError: e.toString()));
    }
  }
  _updateTaskEventHandler(
      UpdateTaskEvent event, Emitter<TaskState> emit) async {
    try {
      emit(UpdateTaskLoading());
      UpdateTasksEntity entity = await UpdateTasksUseCase(sl<TasksRepositoryImp>()).updateTask(event.updateTodoParam);
      emit(UpdateTaskSuccess(data: entity));
    } catch (e) {
      emit(UpdateTaskError(textError: e.toString()));
    }
  }

  _deleteTaskEventHandler(
      DeleteTaskEvent event, Emitter<TaskState> emit) async {
    try {
      emit(DeleteTaskLoading());
      DeleteTasksEntity entity = await DeleteTasksUseCase(sl<TasksRepositoryImp>()).deleteTask(event.deleteTodoParam);
      emit(DeleteTaskSuccess(data: entity));
    } catch (e) {
      emit(DeleteTaskError(textError: e.toString()));
    }
  }
}
