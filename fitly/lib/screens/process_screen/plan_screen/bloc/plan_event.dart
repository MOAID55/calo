part of 'plan_bloc.dart';

@immutable
sealed class PlanEvent {}

final class BalancedEvent extends PlanEvent {}

final class LowCarbsEvent extends PlanEvent {}
