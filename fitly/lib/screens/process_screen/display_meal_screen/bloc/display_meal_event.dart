part of 'display_meal_bloc.dart';

@immutable
sealed class DisplayMealEvent {}

final class LoadedMealEvent extends DisplayMealEvent {}
