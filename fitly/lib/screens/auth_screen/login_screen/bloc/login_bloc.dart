import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitly/core/services/auth_service.dart';
import 'package:fitly/core/services/auth_setup.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});

    on<LoginButtonEvent>((event, emit) async {
      final auth = getIt<AuthService>();
      try {
        final userCredential = await auth.signIn(
          email: event.email,
          password: event.password,
        );
        String? token = await userCredential.user?.getIdToken();
        if (token != null) {
          emit(LoginButtonSuccessfullyState());
        }
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "network-request-failed":
            {
              emit(
                LoginButtonErrorState(
                  errorMessage: "Check your internet connection",
                ),
              );
            }
          default:
            emit(
              LoginButtonErrorState(
                errorMessage: "incorrect email or password",
              ),
            );
        }
      }
    });

    on<RegisterButtonEvent>((event, emit) {
      emit(RegisterButtonState());
    });
  }
}
