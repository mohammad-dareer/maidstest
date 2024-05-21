import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture_example/data/model/task_model.dart';
import 'package:flutter_bloc_clean_architecture_example/presentation/pages/tasks_pages/tasks_widget/task_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../utils/injection_container.dart';
import '../../../../utils/shared_Preferences.dart';
import '../../../bloc/task_bloc/task_bloc.dart';
import '../my_tasks_widget/my_task_item.dart';


class MyTasks extends StatefulWidget {
  const MyTasks({super.key});

  @override
  State<MyTasks> createState() => _MyTasksState();
}

class _MyTasksState extends State<MyTasks> {
  final user = UserPreferrences().getUser();
  bool _enablePullup = true;
  List<Todo> _myTasks = [];
  int _skip = 0;
  int _limit = 10;
  int _deletedId = -1;
  Todo? _updatedValue;
  final RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TaskBloc,TaskState>(
        bloc: sl<TaskBloc>(),
        listener: (context, state){
          if (state is MyTaskSuccess){
            _myTasks.addAll(state.data.tasks.todos);
            _refreshController.loadComplete();
            _refreshController.refreshCompleted();
            if(_myTasks.length >= state.data.tasks.limit){
              _enablePullup = false;
            }
            if(_deletedId >= 0){
              _myTasks.removeWhere((val) => val.id == _deletedId);
              _deletedId = -1;
            }
            if(_updatedValue != null){
              _myTasks.where((val) => val.id == _updatedValue!.id).toList()[0].completed = true;
              _updatedValue = null;
            }
          }
          if(state is MyTaskError){
            _refreshController.loadComplete();
            _refreshController.refreshCompleted();
          }
          if(state is UpdateTaskSuccess){
            _myTasks = [];
            _requestTasks();
            _updatedValue = _myTasks.where((val) => val.id == state.data.todo!.id).first;
          }
          if(state is DeleteTaskSuccess){
            _myTasks = [];
            _requestTasks();
            _deletedId = state.data.deleteTaskModel!.id;
            setState(() {

            });
          }
        },
        builder: (context, state){
          if(state is MyTaskError){
            return Center(
                child: Text(
                    'error: ${state.textError}',
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 15
                  ),
                )
            );
          }
          return Container(
            child:
            _myTasks.isNotEmpty?
            SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: _enablePullup,
              onLoading: (){
                setState(() {
                  _skip += 10;
                  _requestTasks();
                });
              },
              onRefresh: (){
                _limit = _skip;
                _skip = 0;
                _myTasks = [];
                _requestTasks();
                setState(() {

                });
              },
              child: ListView.separated(
                  itemBuilder: (context, index){
                    return MyTaskItem(todo: _myTasks[index],);
                  },
                  separatorBuilder: (context, index){
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: _myTasks.length
              ),
            )
                    :Container(),
          );
        },
      ),

    );
  }


  @override
  void initState(){
    super.initState();
    _requestTasks();
  }


  void _requestTasks() async {
    var u = await user;
    sl<TaskBloc>().add(
      GetMyTasksEvent(
        MyTasksRequestParams(
          userId: u.id??5,
          skip: _skip,
          limit: _limit
        ),
      ),
    );
  }
}
