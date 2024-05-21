import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture_example/data/model/task_model.dart';
import 'package:flutter_bloc_clean_architecture_example/presentation/pages/tasks_pages/tasks_widget/task_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../../utils/injection_container.dart';
import '../../../bloc/task_bloc/task_bloc.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({super.key});

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  //TaskModel _allTasks;
  List<Todo> _tasks = [];
  int _skip = 0;
  int _limit = 10;
  RefreshController _refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TaskBloc,TaskState>(
        bloc: sl<TaskBloc>(),
        listener: (context, state){
          if(state is TaskLoading){
            print('loading');
          }
          if (state is TaskSuccess){
            _tasks.addAll(state.data.tasks!.todos);
            _refreshController.loadComplete();
            _refreshController.refreshCompleted();
            print(_tasks.length);
          }
          if(state is TaskError){
            _refreshController.loadComplete();
            _refreshController.refreshCompleted();
          }
        },
        builder: (context, state){

          if(state is TaskError){
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
                _tasks.isNotEmpty?
            SmartRefresher(
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
              onLoading: (){
                setState(() {
                  _skip += 10;
                  print(_skip);
                  _requestTasks();

                });

              },
              onRefresh: (){
                _limit = _skip;
                _skip = 0;
                _tasks = [];
                _requestTasks();
                setState(() {

                });
              },
              child: ListView.separated(
                  itemBuilder: (context, index){
                    return TaskItem(todo: _tasks[index],);
                  },
                  separatorBuilder: (context, index){
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: _tasks.length
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


  void _requestTasks() {
    sl<TaskBloc>().add(
      GetAllTasksEvent(
        TasksRequestParams(
          skip: _skip,
          limit: _limit
        ),
      ),
    );
  }
}
