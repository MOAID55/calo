part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

final class CreateAccountEvent extends RegisterEvent {
  final String email;
  final String password;
  final String name;

  CreateAccountEvent({required this.email, required this.password,required this.name});
}
