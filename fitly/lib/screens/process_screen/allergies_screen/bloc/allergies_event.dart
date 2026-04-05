part of 'allergies_bloc.dart';

@immutable
sealed class AllergiesEvent {}

final class ButtonChoiceEvent extends AllergiesEvent {
  final String choice;
  ButtonChoiceEvent({required this.choice});
}
