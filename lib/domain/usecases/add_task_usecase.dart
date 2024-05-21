
import 'package:flutter_bloc_clean_architecture_example/data/model/users_model.dart';
import 'package:flutter_bloc_clean_architecture_example/domain/entities/add_tasks_entity.dart'
    as entity;

import '../../data/model/add_task_model.dart';
import '../../data/model/task_model.dart';
import '../../data/repositories/tasks_repository.dart';
import '../../data/repositories/users_repository.dart';

class AddTasksUseCase {
  final TasksRepositoryImp tasksRepositoryImp;
  AddTasksUseCase(this.tasksRepositoryImp);

  Future<entity.AddTasksEntity>addTask(AddTodoParam params) async {
    Todo res = await tasksRepositoryImp.addTask(params);
    entity.AddTasksEntity model =
        entity.AddTasksEntity(todo: res);
    return model;
  }
}
