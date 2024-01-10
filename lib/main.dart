import 'dart:async';

import 'package:demo_ioc_container/app/app_runner.dart';
import 'package:demo_ioc_container/core/utils/logger.dart';

//! Too lazy to write tests
void main() {
  const env = String.fromEnvironment('env', defaultValue: 'dev');

  runZonedGuarded(
    () async => AppRunner(env).run(),
    (error, stack) => logger.e('AppRunner', error: error, stackTrace: stack),
  );
}
