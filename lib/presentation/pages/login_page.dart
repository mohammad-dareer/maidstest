import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture_example/data/model/users_model.dart';
import '../../utils/injection_container.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import 'tasks_pages/tab_view_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _usernameErrorText;
  String? _passwordErrorText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: sl<AuthBloc>(),
          listener: (context, state){
            if(state is AuthSuccess){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  TasksTabBar()),
              );
            }
          },
          builder: (context, state) {
            var fullHeight = MediaQuery.of(context).size.height;
            return SingleChildScrollView(
              child: Container(
                height:MediaQuery.of(context).size.height ,
                padding: const EdgeInsets.only(
                  top: 180,
                  left: 20,
                  right: 20,
                  bottom: 300
                ),
                color: Colors.blueGrey,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                      right: 10,
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                               // margin: const EdgeInsets.symmetric( horizontal: 120),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700,

                                  ),
                              )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "User Name",
                            labelStyle: TextStyle(color: Colors.white)
                          ),
                          controller: _usernameController,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          decoration: const InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(color: Colors.white)
                        ),
                          controller: _passwordController,
                          obscureText: true,
                        ),
                        const SizedBox(
                         height: 20,
                        ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {

                            LoginCredentials credentials = LoginCredentials(
                                userName: _usernameController.text,
                                password: _passwordController.text);
                            print(credentials);
                            sl<AuthBloc>().add(LoginEvent(credentials));
                            },
                              child: const Text("Login")
                          ),
                        ],
                      ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),


    );
  }
}
