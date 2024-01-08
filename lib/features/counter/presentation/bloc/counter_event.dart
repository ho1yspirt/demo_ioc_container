part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementEvent extends CounterEvent {
  const IncrementEvent(this.value);
  final int value;

  @override
  List<Object> get props => [value];
}
