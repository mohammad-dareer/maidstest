import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc_clean_architecture_example/presentation/pages/login_page.dart';
import 'package:flutter_bloc_clean_architecture_example/utils/injection_container.dart';
import 'package:http/http.dart' as http;
import 'presentation/pages/tasks_pages/tab_view_page.dart';
import 'utils/shared_Preferences.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  initInjection();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Future<bool> checkUser() async {
    final user = UserPreferrences().getUser();
    var u = await user;
    if(u.id >= 0) {
      return true;
    }
    return false;
  }

  @override
  void initState(){
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'Flutter Bloc Clean Architecture Example',
          theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
          darkTheme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: Colors.teal,
              brightness: Brightness.dark),
          themeMode: ThemeMode.light,
          home: checkUser() == true ? const TasksTabBar():const LoginPage()
    );
  }
}
