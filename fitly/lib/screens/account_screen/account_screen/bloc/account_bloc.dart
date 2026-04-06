import 'package:bloc/bloc.dart';
import 'package:fitly/core/services/auth_service.dart';
import 'package:fitly/core/services/setup.dart';
import 'package:meta/meta.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final auth = getIt<AuthService>();
  AccountBloc() : super(AccountInitial()) {
    on<AccountEvent>((event, emit) {});

    on<LoadedDataEvent>((event, emit) {
      String name = auth.getUserData().displayName!;
      emit(LoadDataState(name: name));
    });

    on<SignOutEvent>((event, emit) {
      auth.signOut();
      emit(SignOutState());
    });
  }
}
