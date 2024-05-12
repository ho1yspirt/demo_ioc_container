import 'dart:async';

import 'src/app/data/app_runner.dart';
import 'src/core/utils/logger.dart';

//! Too lazy to write tests
void main() {
  const env = String.fromEnvironment('env', defaultValue: 'dev');

  runZonedGuarded(
    () async => AppRunner(env).run(),
    (error, stack) => logger.e('AppRunner', error: error, stackTrace: stack),
  );
}
