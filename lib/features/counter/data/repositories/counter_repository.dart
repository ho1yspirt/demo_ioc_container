import 'package:demo_ioc_container/core/utils/logger.dart';
import 'package:demo_ioc_container/features/counter/data/datasources/counter_data_source.dart';
import 'package:demo_ioc_container/features/counter/domain/repositories/i_counter_repository.dart';

class CounterRepository implements ICounterRepository {
  const CounterRepository(this.counterDataSource);

  final ICounterDataSource counterDataSource;

  @override
  Future<int> getValue() async {
    try {
      return await counterDataSource.getCounterValue();
    } catch (e, s) {
      logger.e('Error', error: e, stackTrace: s);
      throw Exception('$e with $s');
    }
  }

  @override
  Future<void> increment(int value) async {
    try {
      await counterDataSource.setCounterValue(value);
    } catch (e, s) {
      logger.e('Error', error: e, stackTrace: s);
      throw Exception('$e with $s');
    }
  }
}
