
import 'package:flutter_bloc_clean_architecture_example/data/model/users_model.dart';
import 'package:flutter_bloc_clean_architecture_example/domain/entities/tasks_entity.dart'
    as entity;

import '../../data/model/task_model.dart';
import '../../data/repositories/tasks_repository.dart';
import '../../data/repositories/users_repository.dart';

class GetAllTasksUseCase {
  final TasksRepositoryImp tasksRepositoryImp;
  GetAllTasksUseCase(this.tasksRepositoryImp);

  Future<entity.TasksEntity> getAllTasks(TasksRequestParams params) async {
    TaskModel res = await tasksRepositoryImp.getAllTasks(params);
    entity.TasksEntity model =
        entity.TasksEntity(tasks: res);
    return model;
  }
}
