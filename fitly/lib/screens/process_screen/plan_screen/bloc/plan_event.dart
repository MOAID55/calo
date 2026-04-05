part of 'plan_bloc.dart';

@immutable
sealed class PlanEvent {}

final class PlanTypeEvent extends PlanEvent {
  final String planType;
  PlanTypeEvent({required this.planType});
}
