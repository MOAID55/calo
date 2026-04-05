import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'meal_event.dart';
part 'meal_state.dart';

class MealBloc extends Bloc<MealEvent, MealState> {
  MealBloc() : super(MealInitial()) {
    on<MealEvent>((event, emit) {});

    on<ButtonEvent>((event, emit) {
      emit(ButtonState());
    });
  }
}
