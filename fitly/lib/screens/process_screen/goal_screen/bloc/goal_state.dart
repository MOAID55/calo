part of 'goal_bloc.dart';

@immutable
sealed class GoalState {}

final class GoalInitial extends GoalState {}

final class GoalPlanState extends GoalState {
  final String goalPlan;
  GoalPlanState({required this.goalPlan});
}
