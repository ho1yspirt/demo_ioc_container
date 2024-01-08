import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_ioc_container/app/app.dart';
import 'package:demo_ioc_container/app/ioc_container.dart';
import 'package:demo_ioc_container/core/utils/bloc_observer.dart';
import 'package:demo_ioc_container/core/utils/logger.dart';
import 'package:flutter/material.dart';

//! To lazy to write tests
void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();

      Bloc.observer = AppBlocObserver();

      runApp(const DependencyProvider(app: App()));
    },
    (error, stack) => logger.e('AppRunner', error: error, stackTrace: stack),
  );
}
