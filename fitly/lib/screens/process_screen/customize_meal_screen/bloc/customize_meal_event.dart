part of 'customize_meal_bloc.dart';

@immutable
sealed class CustomizeMealEvent {}

class LoadDataEvent extends CustomizeMealEvent {}

class ChangeMealQty extends CustomizeMealEvent {
  final String meal;  
  final int quantity;  

  ChangeMealQty({
    required this.meal,
    required this.quantity,
  });
}