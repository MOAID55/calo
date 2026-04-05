part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class SaveButtonEvent extends ProfileEvent {
  final String email;
  final String password;
  final String name;

  SaveButtonEvent({
    required this.email,
    required this.password,
    required this.name,
  });
}

final class LoadDataProfileEvent extends ProfileEvent {}
