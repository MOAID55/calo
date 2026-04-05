import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'allergies_event.dart';
part 'allergies_state.dart';

class AllergiesBloc extends Bloc<AllergiesEvent, AllergiesState> {
  AllergiesBloc() : super(AllergiesInitial()) {
    on<AllergiesEvent>((event, emit) {});
    on<ButtonYesEvent>((event, emit) {
      emit(ButtonYesState(choice: "Yes"));
    });
    on<ButtonNoEvent>((event, emit) {
      emit(ButtonNoState(choice: "No"));
    });
  }
}
