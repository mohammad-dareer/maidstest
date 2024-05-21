
import 'package:flutter_bloc_clean_architecture_example/data/model/users_model.dart';
import 'package:flutter_bloc_clean_architecture_example/domain/entities/update_tasks_entity.dart'
    as entity;

import '../../data/model/add_task_model.dart';
import '../../data/model/task_model.dart';
import '../../data/model/update_task_model.dart';
import '../../data/repositories/tasks_repository.dart';
import '../../data/repositories/users_repository.dart';

class UpdateTasksUseCase {
  final TasksRepositoryImp tasksRepositoryImp;
  UpdateTasksUseCase(this.tasksRepositoryImp);

  Future<entity.UpdateTasksEntity>updateTask(UpdateTodoParam params) async {
    Todo res = await tasksRepositoryImp.updateTask(params);
    entity.UpdateTasksEntity model =
        entity.UpdateTasksEntity(todo: res);
    return model;
  }
}
