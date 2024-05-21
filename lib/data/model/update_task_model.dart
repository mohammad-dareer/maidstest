

class UpdateTodoParam{
  late bool completed;
  late int taskId;
  UpdateTodoParam({
    required this.completed,
    required this.taskId,
});
  @override
  UpdateTodoParam.fromJson(Map<String, dynamic> json) {
    completed = json['completed']??false;
    taskId = json['taskId']??0;

  }

  Map<String, dynamic> toJson(){
    return {
      'completed': completed,
      'taskId': taskId,
    };
  }
}
