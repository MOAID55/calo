part of 'display_meal_bloc.dart';

@immutable
sealed class DisplayMealState {}

final class DisplayMealInitial extends DisplayMealState {}

final class MealLoadedState extends DisplayMealState {
  final List<CategoryModel> category;

  MealLoadedState({required this.category});
}
