import 'package:bloc/bloc.dart';
import 'package:demo_ioc_container/features/counter/domain/usecases/counter_usecase.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(this.useCase) : super(CounterInitial()) {
    on<IncrementEvent>((event, emit) async {
      try {
        emit(CounterLoading());
        await useCase.increment(event.value);
        int newValue = await useCase.getValue();
        await Future.delayed(const Duration(seconds: 1));
        emit(CounterSuccess(newValue));
      } catch (e, s) {
        emit(CounterError(e, s));
      }
    });
  }
  final ICounterUseCase useCase;
}
