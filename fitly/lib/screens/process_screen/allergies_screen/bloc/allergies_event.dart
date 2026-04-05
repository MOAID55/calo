part of 'allergies_bloc.dart';

@immutable
sealed class AllergiesEvent {}

final class ButtonYesEvent extends AllergiesEvent {}

final class ButtonNoEvent extends AllergiesEvent {}
