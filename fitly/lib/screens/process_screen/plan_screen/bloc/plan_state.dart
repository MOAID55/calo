part of 'plan_bloc.dart';

@immutable
sealed class PlanState {}

final class PlanInitial extends PlanState {}

final class LowCarbsState extends PlanState {
  final String lowCarbs;
  LowCarbsState({required this.lowCarbs});
}

final class BalancedState extends PlanState {
  final String balanced;
  BalancedState({required this.balanced});
}
