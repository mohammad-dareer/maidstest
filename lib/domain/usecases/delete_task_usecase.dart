
import 'package:flutter_bloc_clean_architecture_example/data/model/delete_task_model.dart';
import 'package:flutter_bloc_clean_architecture_example/data/model/users_model.dart';
import 'package:flutter_bloc_clean_architecture_example/domain/entities/delete_tasks_entity.dart'
    as entity;

import '../../data/model/add_task_model.dart';
import '../../data/model/task_model.dart';
import '../../data/model/update_task_model.dart';
import '../../data/repositories/tasks_repository.dart';
import '../../data/repositories/users_repository.dart';

class DeleteTasksUseCase {
  final TasksRepositoryImp tasksRepositoryImp;
  DeleteTasksUseCase(this.tasksRepositoryImp);

  Future<entity.DeleteTasksEntity>deleteTask(DeleteTodoParam params) async {
    DeleteTaskModel res = await tasksRepositoryImp.deleteTask(params);
    entity.DeleteTasksEntity model =
        entity.DeleteTasksEntity (deleteTaskModel : res);
    return model;
  }
}
