part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UsersEntity data;
  const AuthSuccess({required this.data});
  @override
  List<Object> get props => [data];
}

class AuthError extends AuthState {
  final String textError;
  const AuthError({required this.textError});

  @override
  List<Object> get props => [textError];
}
