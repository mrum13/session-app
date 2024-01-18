part of 'single_data_cubit.dart';

abstract class SingleDataState extends Equatable {
  const SingleDataState();

  @override
  List<Object> get props => [];
}

class SingleDataInitial extends SingleDataState {}

class SingleDataLoading extends SingleDataState {}

class SingleDataSuccess extends SingleDataState {
  final String data;

  const SingleDataSuccess(
    this.data,
  );

  @override
  List<Object> get props => [data];
}

class SingleDataFailed extends SingleDataState {
  final String error;

  const SingleDataFailed(this.error);

  @override
  List<Object> get props => [error];
}