import 'dart:convert';

import 'package:flutter_bloc_clean_architecture_example/utils/helper.dart';
import 'package:http/http.dart' as http;

import '../model/users_model.dart';

abstract class UsersRepository {
  Future<UserModel> login(LoginCredentials credentials);
}

class UsersRepositoryImp implements UsersRepository {
 // final http.Client client;
  UsersRepositoryImp();

  @override
  Future<UserModel> login(LoginCredentials credentials) async {
    var response = await http.Client().post(
        Uri.parse("https://dummyjson.com/auth/login"),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(credentials.toJson()));
    if (response.statusCode != 200) {

      throw (Helper.generateResponse(response));
    }
    return UserModel.fromJson(jsonDecode(response.body));
  }
}
