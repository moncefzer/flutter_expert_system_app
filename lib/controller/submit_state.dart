part of 'submit_cubit.dart';

abstract class SubmitState extends Equatable {
  const SubmitState();
}

class SubmitInitial extends SubmitState {
  @override
  List<Object> get props => [];
}

class SubmitLoading extends SubmitState {
  @override
  List<Object> get props => [];
}

class SubmitLoaded extends SubmitState {
  final Result result;

  const SubmitLoaded(this.result);
  @override
  List<Object> get props => [];
}

class SubmitError extends SubmitState {
  final String message;

  const SubmitError(this.message);
  @override
  List<Object> get props => [message];
}
