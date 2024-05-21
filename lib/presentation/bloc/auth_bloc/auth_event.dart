part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final LoginCredentials credentials;
  const LoginEvent(this.credentials);
  @override
  List<Object> get props => [credentials];
}
