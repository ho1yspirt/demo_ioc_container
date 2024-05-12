part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

class CounterInitial extends CounterState {}

class CounterLoading extends CounterState {}

class CounterSuccess extends CounterState {
  const CounterSuccess(
    this.value,
  );

  final int value;

  @override
  List<Object> get props => [
        value,
      ];
}

class CounterError extends CounterState {
  const CounterError(
    this.e,
    this.s,
  );

  final Object e;
  final StackTrace s;

  @override
  List<Object> get props => [
        e,
        s,
      ];
}
