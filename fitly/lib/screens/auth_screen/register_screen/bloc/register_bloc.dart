import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitly/core/services/auth_service.dart';
import 'package:fitly/core/services/auth_setup.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  String errorMessage = "";

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});
    on<CreateAccountEvent>((event, emit) async {
      try {
        final auth = getIt<AuthService>();
        await auth.createAccount(
          email: event.email,
          password: event.password,
          name: event.name,
        );

        emit(CreateAccountSussecceflyState());
      } on FirebaseAuthException catch (e) {
        switch (e.code) {
          case "network-request-failed":
            {
              emit(
                CreateAccountErrorState(
                  errorMessage: "Check your internet connection",
                ),
              );
            }
          case "email-already-in-use":
            emit(
              CreateAccountErrorState(
                errorMessage: "This email is already registered",
              ),
            );
          default:
            emit(
              CreateAccountErrorState(
                errorMessage: e.message ?? "Something Went Wrong / Try Again",
              ),
            );
        }
      }
    });
  }
}
