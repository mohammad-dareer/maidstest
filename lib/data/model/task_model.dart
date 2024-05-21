class TaskModel {
  late int total;
  late int skip;
  late int limit;
  List<Todo> todos = [];


  TaskModel(
      {required this.limit,
        required this.skip,
        required this.todos,
        required this.total,});
  @override
  TaskModel.fromJson(Map<String, dynamic> json) {
    limit = json['limit']??'';
    skip = json['skip']??'';
    total = json['total']??'';
    for (var i = 0; i < json['todos'].length; i++){
      todos.add(Todo.fromJson(json['todos'][i]));
    }
  }
}


class Todo{
  late int id;
  late String todo;
  late bool completed;
  late int userId;
  Todo({
    required this.todo,
    required this.id,
    required this.completed,
    required this.userId,
});
  @override
  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo']??'';
    completed = json['completed']??'';
    userId = json['userId']??0;

  }

  Map<String, dynamic> toJson(){
    return {
      'username': todo,
      'id': id,
      'completed': completed,
      'userId': userId,
    };
  }
}

class TasksRequestParams{
  late int skip;
  late int limit;

  TasksRequestParams({
    required this.skip,
    required this.limit
  });
  Map<String, dynamic> toJson(){
    return{
      'skip': skip, 'limit': limit
    };
  }
}

class MyTasksRequestParams{
  late int userId;
  late int skip;
  late int limit;

  MyTasksRequestParams({
    required this.userId,
    required this.skip,
    required this.limit
  });
  Map<String, dynamic> toJson(){
    return{
      'userId': userId, 'skip': skip, 'limit': limit
    };
  }
}