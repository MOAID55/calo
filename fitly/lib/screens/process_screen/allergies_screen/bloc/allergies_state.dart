part of 'allergies_bloc.dart';

@immutable
sealed class AllergiesState {}

final class AllergiesInitial extends AllergiesState {}

final class ButtonChoiceState extends AllergiesState {
  final String choice;
  ButtonChoiceState({required this.choice});
}
