import '../../../../core/utils/logger.dart';
import '../repositories/i_counter_repository.dart';

abstract interface class ICounterUseCase {
  Future<int> getValue();

  Future<void> increment(int value);
}

class CounterUseCase implements ICounterUseCase {
  const CounterUseCase(this.repository);

  final ICounterRepository repository;

  @override
  Future<int> getValue() async {
    try {
      return await repository.getValue();
    } catch (e, s) {
      logger.e('Error', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> increment(int value) async {
    try {
      int currentValue = await repository.getValue();

      await repository.increment(currentValue + value);
    } catch (e, s) {
      logger.e('Error', error: e, stackTrace: s);
      rethrow;
    }
  }
}
