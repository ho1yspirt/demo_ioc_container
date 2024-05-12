import '../../../../core/utils/logger.dart';
import '../../domain/repositories/i_counter_repository.dart';
import '../datasources/counter_data_source.dart';

class CounterRepository implements ICounterRepository {
  const CounterRepository(
    this.counterDataSource,
  );

  final ICounterDataSource counterDataSource;

  @override
  Future<int> getValue() async {
    try {
      return await counterDataSource.getCounterValue();
    } catch (e, s) {
      logger.e('Error', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> increment(int value) async {
    try {
      await counterDataSource.setCounterValue(value);
    } catch (e, s) {
      logger.e('Error', error: e, stackTrace: s);
      rethrow;
    }
  }
}
