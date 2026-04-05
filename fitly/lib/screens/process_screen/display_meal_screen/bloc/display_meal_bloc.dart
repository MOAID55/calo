import 'package:bloc/bloc.dart';
import 'package:fitly/data/repo/mock_repository.dart';
import 'package:fitly/models/category_model/category_model.dart';
import 'package:meta/meta.dart';

part 'display_meal_event.dart';
part 'display_meal_state.dart';

class DisplayMealBloc extends Bloc<DisplayMealEvent, DisplayMealState> {
  final repoCategories = MockRepository().getCategories();
  DisplayMealBloc() : super(DisplayMealInitial()) {
    on<DisplayMealEvent>((event, emit) {
      emit(MealLoadedState(category: repoCategories));
    });
  }
}
