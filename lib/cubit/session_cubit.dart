import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'session_state.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(SessionInitial());

  void setSession() {
    try {
      emit(const SessionOut("Session habis !"));
    } catch(e) {
      throw(e.toString());
    }
  }

  void setInit() {
    emit(SessionInitial());
  }
}
