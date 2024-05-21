
import 'package:flutter_bloc_clean_architecture_example/data/model/users_model.dart';
import 'package:flutter_bloc_clean_architecture_example/domain/entities/users_entity.dart'
    as entity;

import '../../data/repositories/users_repository.dart';

class LoginUseCase {
  final UsersRepositoryImp usersRepositoryImp;
  LoginUseCase(this.usersRepositoryImp);

  Future<entity.UsersEntity> login(LoginCredentials credentials) async {
    UserModel res = await usersRepositoryImp.login(credentials);
    entity.UsersEntity model =
        entity.UsersEntity(user: res);
    return model;
  }
}
