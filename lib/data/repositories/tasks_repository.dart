import 'dart:convert';

import 'package:flutter_bloc_clean_architecture_example/utils/helper.dart';
import 'package:http/http.dart' as http;

import '../model/add_task_model.dart';
import '../model/delete_task_model.dart';
import '../model/task_model.dart';
import '../model/update_task_model.dart';
import '../model/users_model.dart';

abstract class TasksRepository {
  Future<TaskModel> getAllTasks(TasksRequestParams params);
  Future<TaskModel> getMyTasks(MyTasksRequestParams params);
  Future<Todo> addTask(AddTodoParam params);
  Future<Todo> updateTask(UpdateTodoParam params);
  Future<DeleteTaskModel> deleteTask(DeleteTodoParam params);
}

class TasksRepositoryImp implements TasksRepository {
 // final http.Client client;
  TasksRepositoryImp();

  @override
  Future<TaskModel> getAllTasks(TasksRequestParams params) async {
    var uri = 'https://dummyjson.com/todos?limit=${params.limit}&skip=${params.skip}';

    var response = await http.Client().get(
        Uri.parse(uri),
        headers: {'Content-Type': 'application/json'},);
    if (response.statusCode != 200) {
      throw (Helper.generateResponse(response));
    }
    return TaskModel.fromJson(jsonDecode(response.body));
  }



  @override
  Future<TaskModel> getMyTasks(MyTasksRequestParams params) async {
    var uri = 'https://dummyjson.com/todos/user/${params.userId}';

    var response = await http.Client().get(
      Uri.parse(uri),
      headers: {'Content-Type': 'application/json'},);
    if (response.statusCode != 200) {
      throw (Helper.generateResponse(response));
    }
    return TaskModel.fromJson(jsonDecode(response.body));
  }


  @override
  Future<Todo> addTask(AddTodoParam params) async {
    var uri = 'https://dummyjson.com/todos/add';

    var response = await http.Client().post(
      Uri.parse(uri),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(params.toJson())
    );
    if (response.statusCode != 200) {
      throw (Helper.generateResponse(response));
    }
    return Todo.fromJson(jsonDecode(response.body));
  }


  @override
  Future<Todo> updateTask(UpdateTodoParam params) async {
    var uri = "https://dummyjson.com/todos/${params.taskId}";

    var response = await http.Client().put(
        Uri.parse(uri),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(params.toJson())
    );
    if (response.statusCode != 200) {
      throw (Helper.generateResponse(response));
    }
    return Todo.fromJson(jsonDecode(response.body));
  }

  @override
  Future<DeleteTaskModel> deleteTask(DeleteTodoParam params) async {
    var uri = "https://dummyjson.com/todos/${params.taskId}";

    var response = await http.Client().delete(
        Uri.parse(uri),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(params.toJson())
    );
    if (response.statusCode != 200) {
      throw (Helper.generateResponse(response));
    }
    return DeleteTaskModel.fromJson(jsonDecode(response.body));
  }
}
