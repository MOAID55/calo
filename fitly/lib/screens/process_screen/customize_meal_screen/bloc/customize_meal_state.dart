part of 'customize_meal_bloc.dart';

@immutable
sealed class CustomizeMealState {}

final class CustomizeMealInitial extends CustomizeMealState {}

final class TotalCaloriesPriceState extends CustomizeMealState {
  final int totalCalories;
  final int perDayPrice;
  TotalCaloriesPriceState({required this.totalCalories, required this.perDayPrice});
}
