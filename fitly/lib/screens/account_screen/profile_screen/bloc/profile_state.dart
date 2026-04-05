part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class SaveButtonState extends ProfileState {}

final class NameEmpty extends ProfileState {}

final class SaveButtonFailState extends ProfileState {
  final String message;
  SaveButtonFailState({required this.message});
}

final class LoadDataProfileState extends ProfileState {
  final String name;
  final String email;

  LoadDataProfileState({required this.name, required this.email});
}
