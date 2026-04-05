import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customize_meal_event.dart';
part 'customize_meal_state.dart';

class CustomizeMealBloc extends Bloc<CustomizeMealEvent, CustomizeMealState> {
  // Quantity meals
  int totalCalories = 0;
  int breakfastQty = 0;
  int lunchQty = 1;
  int dinnerQty = 0;
  int snacksQty = 1;
  int caloriesDinnerLunchBreakFast = 475;
  int caloryBreakfast = 175;

  //price meals
  int snackPrice = 12;
  int breakFastPrice = 15;
  int lunchPrice = 18;
  int dinnerPrice = 18;
  int perDayPrice = 0;

  CustomizeMealBloc() : super(CustomizeMealInitial()) {
    on<LoadDataEvent>((event, emit) {
      final totalCalories =
          (breakfastQty * caloriesDinnerLunchBreakFast) +
          (lunchQty * caloriesDinnerLunchBreakFast) +
          (dinnerQty * caloriesDinnerLunchBreakFast) +
          (snacksQty * caloryBreakfast);

      final perDayPrice =
          (breakfastQty * breakFastPrice) +
          (lunchQty * lunchPrice) +
          (dinnerQty * dinnerPrice) +
          (snacksQty * snackPrice);

      emit(TotalCaloriesPriceState(totalCalories: totalCalories,perDayPrice: perDayPrice),
      );
    });

    on<ChangeMealQty>((event, emit) {
      switch (event.meal) {
        case 'BreakFast':
          breakfastQty = event.quantity;
          break;
        case 'Lunch':
          lunchQty = event.quantity;
          break;
        case 'Dinner':
          dinnerQty = event.quantity;
          break;
        case 'Snacks':
          snacksQty = event.quantity;
          break;
      }
      final totalCalories =
          (breakfastQty * caloriesDinnerLunchBreakFast) +
          (lunchQty * caloriesDinnerLunchBreakFast) +
          (dinnerQty * caloriesDinnerLunchBreakFast) +
          (snacksQty * caloryBreakfast);

      final perDayPrice =
          (breakfastQty * breakFastPrice) +
          (lunchQty * lunchPrice) +
          (dinnerQty * dinnerPrice) +
          (snacksQty * snackPrice);

      emit(TotalCaloriesPriceState(totalCalories: totalCalories,perDayPrice: perDayPrice),
      );
    });
  }
}
