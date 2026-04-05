part of 'gender_bloc.dart';

@immutable
sealed class GenderEvent {}

final class ChoiceGenderEvent extends GenderEvent {
  final String gender;
  ChoiceGenderEvent({required this.gender});
}
