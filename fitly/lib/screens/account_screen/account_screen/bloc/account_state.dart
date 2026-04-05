part of 'account_bloc.dart';

@immutable
sealed class AccountState {}

final class AccountInitial extends AccountState {}

final class SignOutState extends AccountState {}



final class LoadDataState extends AccountState {
  final String name;
  LoadDataState({required this.name});
}


