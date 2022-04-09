part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginDone extends AuthState {}

class LoginError extends AuthState {
  final String msg;
  const LoginError(this.msg);
}

class LogoutLoading extends AuthState {}

class LogoutDone extends AuthState {
  final String msg;
  const LogoutDone(this.msg);
}

class LogoutError extends AuthState {
  final String msg;
  const LogoutError(this.msg);
}
