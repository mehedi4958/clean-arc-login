import 'package:bloc/bloc.dart';
import 'package:clean_arc_login/domain/entity/person_entity.dart';
import 'package:clean_arc_login/domain/usecase/person_usecase.dart';

import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<InitEvent>(_init);
    on<SignInTriggerEvent>(_signIn);
  }

  void _init(InitEvent event, Emitter<SignInState> emit) async {}

  void _signIn(SignInTriggerEvent event, Emitter<SignInState> emit) async {
    PersonUserCaseImpl personUserCaseImpl = PersonUserCaseImpl();
    PersonEntity personEntity = personUserCaseImpl.getPerson(
      email: event.email,
    );
    emit(state.copyWith(isLoggedIn: true, email: personEntity.email));
  }
}
