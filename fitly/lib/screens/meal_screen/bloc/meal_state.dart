part of 'meal_bloc.dart';

@immutable
sealed class MealState {}

final class MealInitial extends MealState {}

final class ButtonState extends MealState {}

