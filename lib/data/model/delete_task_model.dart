class DeleteTaskModel {
  late int id;
  late String todo;
  late bool completed;
  late bool isDeleted;
  late int userId;


  DeleteTaskModel(
      {required this.id,
        required this.completed,
        required this.todo,
        required this.userId,
        required this.isDeleted,});
  @override
  DeleteTaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo']??'';
    completed = json['completed']??'';
    userId = json['userId']??0;
    isDeleted = json['isDeleted']??0;
  }
}


class DeleteTodoParam{
  late int taskId;
  DeleteTodoParam({
    required this.taskId,
});
  @override
  DeleteTodoParam.fromJson(Map<String, dynamic> json) {
    taskId = json['taskId']??0;

  }

  Map<String, dynamic> toJson(){
    return {
      'taskId': taskId,
    };
  }
}
