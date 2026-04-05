part of 'gender_bloc.dart';

@immutable
sealed class GenderState {}

final class GenderInitial extends GenderState {}

final class ChoiceGenderState extends GenderState {
  final String gender;
  ChoiceGenderState({required this.gender});
}


