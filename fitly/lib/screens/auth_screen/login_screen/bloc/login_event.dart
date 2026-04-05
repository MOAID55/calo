part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class RegisterButtonEvent extends LoginEvent {}

final class LoginButtonEvent extends LoginEvent {
  final String email;
  final String password;
  LoginButtonEvent({required this.email, required this.password});
}
