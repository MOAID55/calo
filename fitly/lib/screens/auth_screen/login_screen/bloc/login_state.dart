part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class RegisterButtonState extends LoginState {}

final class LoginButtonSuccessfullyState extends LoginState {}

final class LoginButtonErrorState extends LoginState {
  final String errorMessage;
  LoginButtonErrorState({required this.errorMessage});
}
