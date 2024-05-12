abstract interface class ICounterRepository {
  Future<int> getValue();

  Future<void> increment(int value);
}
