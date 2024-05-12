import '../data/dependencies.dart';

abstract interface class IAppRunner {
  Future<Dependencies> preloadData();

  Future<void> run();
}
