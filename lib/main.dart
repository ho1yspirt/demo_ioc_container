import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_ioc_container/app/app.dart';
import 'package:demo_ioc_container/app/app_error.dart';
import 'package:demo_ioc_container/app/ioc_container.dart';
import 'package:demo_ioc_container/core/utils/bloc_observer.dart';
import 'package:demo_ioc_container/core/utils/logger.dart';
import 'package:flutter/material.dart';

//! Too lazy to write tests
void main() {
  const env = String.fromEnvironment('env', defaultValue: 'dev');

  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();

      Bloc.observer = AppBlocObserver();

      initializeDependencies(env).then(
        (dependencies) => runApp(
          InheritedDependencies(dependencies: dependencies, child: const App()),
        ),
        onError: (Object? e) => runApp(AppError(e: e)),
      );
    },
    (error, stack) => logger.e('AppRunner', error: error, stackTrace: stack),
  );
}
