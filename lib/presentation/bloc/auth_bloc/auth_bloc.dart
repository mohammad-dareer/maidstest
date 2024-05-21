import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture_example/data/model/users_model.dart';
import 'package:flutter_bloc_clean_architecture_example/domain/entities/users_entity.dart';
import 'package:flutter_bloc_clean_architecture_example/domain/usecases/login_usecase.dart';

import '../../../data/repositories/users_repository.dart';
import '../../../utils/injection_container.dart';
import '../../../utils/shared_Preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>(_loginEventHandler);
  }

  _loginEventHandler(
      LoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      UsersEntity entity = await LoginUseCase(sl<UsersRepositoryImp>()).login(event.credentials);
      if(entity.user != null){
        UserPreferrences().saveUser(entity.user!);
      }
      emit(AuthSuccess(data: entity));
    } catch (e) {
      emit(AuthError(textError: e.toString()));
    }
  }
}
