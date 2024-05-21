
import 'package:flutter_bloc_clean_architecture_example/data/model/users_model.dart';
import 'package:flutter_bloc_clean_architecture_example/domain/entities/tasks_entity.dart'
    as entity;

import '../../data/model/task_model.dart';
import '../../data/repositories/tasks_repository.dart';
import '../../data/repositories/users_repository.dart';

class GetMyTasksUseCase {
  final TasksRepositoryImp tasksRepositoryImp;
  GetMyTasksUseCase(this.tasksRepositoryImp);

  Future<entity.TasksEntity> getMyTasks(MyTasksRequestParams params) async {
    TaskModel res = await tasksRepositoryImp.getMyTasks(params);
    entity.TasksEntity model =
        entity.TasksEntity(tasks: res);
    return model;
  }
}
