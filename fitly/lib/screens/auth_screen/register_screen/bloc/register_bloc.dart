import 'package:bloc/bloc.dart';
import 'package:fitly/core/services/auth_service.dart';
import 'package:fitly/core/services/setup.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});
    on<CreateAccountEvent>((event, emit) async {
      final auth = getIt<AuthService>();
      final checkSuccessfulCreate = await auth.createAccount(
        email: event.email,
        password: event.password,
        name: event.name,
      );

      checkSuccessfulCreate.fold(
        (onLeft) {
          emit(CreateAccountErrorState(errorMessage: onLeft));
        },
        (onRight) {
          emit(CreateAccountSussecceflyState());
        },
      );
    });
  }
}
