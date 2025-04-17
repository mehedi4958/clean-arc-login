import 'package:bloc/bloc.dart';

import 'sign_in_event.dart';
import 'sign_in_state.dart';

class Sign_inBloc extends Bloc<Sign_inEvent, Sign_inState> {
  Sign_inBloc() : super(Sign_inState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<Sign_inState> emit) async {
    emit(state.clone());
  }
}
