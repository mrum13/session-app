part of 'session_cubit.dart';

abstract class SessionState extends Equatable {
  const SessionState();

  @override
  List<Object> get props => [];
}

class SessionInitial extends SessionState {}

class SessionOut extends SessionState {
  final String message;

  const SessionOut(
    this.message,
  );

  @override
  List<Object> get props => [message];
}