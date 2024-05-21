

class AddTodoParam{
  late String todo;
  late bool completed;
  late int userId;
  AddTodoParam({
    required this.todo,
    required this.completed,
    required this.userId,
});
  @override
  AddTodoParam.fromJson(Map<String, dynamic> json) {
    todo = json['todo']??'';
    completed = json['completed']??'';
    userId = json['userId']??0;

  }

  Map<String, dynamic> toJson(){
    return {
      'username': todo,
      'completed': completed,
      'userId': userId,
    };
  }
}
