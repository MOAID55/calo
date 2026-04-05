part of 'goal_bloc.dart';

@immutable
sealed class GoalEvent {}

final class GoalPlanEvent extends GoalEvent {
  final String goalPlan;
  GoalPlanEvent({required this.goalPlan});
}


