part of 'account_bloc.dart';

@immutable
sealed class AccountEvent {}

final class ProfileButtonEvent extends AccountEvent {}

final class LoadedDataEvent extends AccountEvent {}

final class SignOutEvent extends AccountEvent {}
