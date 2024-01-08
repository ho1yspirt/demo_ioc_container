import 'package:demo_ioc_container/features/counter/domain/repositories/i_counter_repository.dart';

abstract interface class ICounterUseCase {
  Future<int> getValue();

  Future<void> increment(int value);
}

class CounterUseCase implements ICounterUseCase {
  const CounterUseCase(this.repository);

  final ICounterRepository repository;

  @override
  Future<int> getValue() => repository.getValue();

  @override
  Future<void> increment(int value) async {
    int currentValue = await repository.getValue();
    await repository.increment(currentValue + value);
  }
}
