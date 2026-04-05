part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class CreateAccountSussecceflyState extends RegisterState {}

final class CreateAccountErrorState extends RegisterState {
  final String errorMessage;
  CreateAccountErrorState({required this.errorMessage});
}
