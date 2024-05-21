import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture_example/data/model/task_model.dart';

class TaskItem extends StatefulWidget {
  final Todo todo;
  TaskItem({super.key,required this.todo});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color:widget.todo.completed? Colors.green[100]:Colors.red[100],
      ),
      margin: EdgeInsets.symmetric(horizontal: 20),
      
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          if(widget.todo.completed)
            const Image(
                image: AssetImage('assets/images/done.png'),
              width: 80,
              height: 80,
            )
          else
            const Image(
              image: AssetImage('assets/images/not_done.png'),
              width: 80,
              height: 80,),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(widget.todo.todo)
              )
            ],
          )
        ],
      ),
    );
  }
}
