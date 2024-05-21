import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture_example/presentation/pages/tasks_pages/my_tasks_screens/my_tasks.dart';
import 'dart:ui';

import 'tasks_screeens/all_tasks.dart';


class TasksTabBar extends StatefulWidget {
  const TasksTabBar({super.key});


  @override
  State<TasksTabBar> createState() => _TasksTabBarState();
}

class _TasksTabBarState extends State<TasksTabBar> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Text('All Tasks')),
                Tab(icon: Text('My Tasks')),
              ],
            ),
            title: const Text('Tasks'),
          ),
          body: const TabBarView(
            children: [
              AllTasks(),
              MyTasks(),
            ],
          ),
        ),
    );
  }
}