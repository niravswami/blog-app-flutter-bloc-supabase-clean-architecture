part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final User user;

  AuthSuccess(this.user);
}

final class AuthFailure extends AuthState {
  final String message;
  AuthFailure(this.message);
}

final class AuthLogoutLoading extends AuthState {}

final class AuthLogoutSuccess extends AuthState {}

final class AuthLogoutFailure extends AuthState {
  final String message;
  AuthLogoutFailure(this.message);
}
