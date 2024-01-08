import 'package:shared_preferences/shared_preferences.dart';

abstract interface class ICounterDataSource {
  Future<int> getCounterValue();
  Future<void> setCounterValue(int value);
}

//? Yes, instance of prefs is not inited once :(
class CounterDataSource implements ICounterDataSource {
  static const String _counterKey = 'counter';
  SharedPreferences? _prefs;

  Future<SharedPreferences> get _preferences async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  @override
  Future<int> getCounterValue() async {
    final prefs = await _preferences;
    return prefs.getInt(_counterKey) ?? 0;
  }

  @override
  Future<void> setCounterValue(int value) async {
    final prefs = await _preferences;
    await prefs.setInt(_counterKey, value);
  }
}
