import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture_example/data/model/task_model.dart';
import 'package:flutter_bloc_clean_architecture_example/utils/injection_container.dart';

import '../../../../data/model/delete_task_model.dart';
import '../../../../data/model/update_task_model.dart';
import '../../../bloc/task_bloc/task_bloc.dart';

class MyTaskItem extends StatefulWidget {
  final Todo todo;
  MyTaskItem({super.key,required this.todo});

  @override
  State<MyTaskItem> createState() => _MyTaskItemState();
}

class _MyTaskItemState extends State<MyTaskItem> {
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent
                    ),
                      onPressed: _DeleteComplete,
                      child: Text('Delete')
                  ),
                  SizedBox(width: 10,),
                  if(!widget.todo.completed)
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent
                      ),
                      onPressed: _setTaskComplete,
                      child: Text('Set Complete'))
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void _setTaskComplete() {
    sl<TaskBloc>().add(
      UpdateTaskEvent(
        UpdateTodoParam(
          completed: true,
          taskId: widget.todo.id
        ),
      ),
    );
  }

  void _DeleteComplete() {
    sl<TaskBloc>().add(
      DeleteTaskEvent(
        DeleteTodoParam(
            taskId: widget.todo.id
        ),
      ),
    );
  }
}
