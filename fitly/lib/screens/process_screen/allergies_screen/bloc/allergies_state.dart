part of 'allergies_bloc.dart';

@immutable
sealed class AllergiesState {}

final class AllergiesInitial extends AllergiesState {}

final class ButtonYesState extends AllergiesState {
  final String choice;

  ButtonYesState({required this.choice});
}

final class ButtonNoState extends AllergiesState {
  final String choice;
  ButtonNoState({required this.choice});
}
