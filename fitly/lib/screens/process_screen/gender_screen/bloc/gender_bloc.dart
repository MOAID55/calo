import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'gender_event.dart';
part 'gender_state.dart';

class GenderBloc extends Bloc<GenderEvent, GenderState> {
  GenderBloc() : super(GenderInitial()) {
    on<GenderEvent>((event, emit) {});

    on<ChoiceGenderEvent>((event, emit) {
      emit(ChoiceGenderState(gender: event.gender));
    });
  }
}
