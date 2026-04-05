part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class AppearLogoState extends SplashState {}

final class AlreadySignInState extends SplashState {}

final class LoginPageState extends SplashState {}


