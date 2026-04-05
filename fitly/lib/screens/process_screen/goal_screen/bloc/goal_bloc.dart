import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'goal_event.dart';
part 'goal_state.dart';

class GoalBloc extends Bloc<GoalEvent, GoalState> {
  GoalBloc() : super(GoalInitial()) {
    on<GoalEvent>((event, emit) {});
    on<GoalPlanEvent>((event, emit) {
      emit(GoalPlanState(goalPlan: event.goalPlan));
    });
    
  }
}
