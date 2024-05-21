import 'package:flutter_bloc_clean_architecture_example/data/model/users_model.dart';

class UsersEntity {
  UserModel? user;
  UsersEntity({this.user});
}

class Result {
  int? id;
  String? english;
  String? indo;
  String? character;
  String? anime;
  Result({this.id, this.english, this.indo, this.character, this.anime});
}
