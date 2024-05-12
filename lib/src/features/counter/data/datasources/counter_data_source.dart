import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/logger.dart';

abstract interface class ICounterDataSource {
  Future<int> getCounterValue();

  Future<void> setCounterValue(int value);
}

class CounterDataSource implements ICounterDataSource {
  const CounterDataSource(
    this.sharedPreferences,
  );

  final SharedPreferences sharedPreferences;

  static const String _counterKey = 'counter';

  @override
  Future<int> getCounterValue() async {
    try {
      return sharedPreferences.getInt(_counterKey) ?? 0;
    } catch (e, s) {
      logger.e('Error', error: e, stackTrace: s);
      rethrow;
    }
  }

  @override
  Future<void> setCounterValue(int value) async {
    try {
      await sharedPreferences.setInt(_counterKey, value);
    } catch (e, s) {
      logger.e('Error', error: e, stackTrace: s);
      rethrow;
    }
  }
}
