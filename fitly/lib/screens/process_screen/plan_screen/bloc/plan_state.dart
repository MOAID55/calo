part of 'plan_bloc.dart';

@immutable
sealed class PlanState {}

final class PlanInitial extends PlanState {}

final class PlanTypeState extends PlanState {
  final String planType;
  PlanTypeState({required this.planType});
}


