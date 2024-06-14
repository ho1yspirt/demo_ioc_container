import 'dart:async';

import 'package:demo_ioc_container/src/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/bloc_observer.dart';
import '../domain/i_app_runner.dart';
import '../widget/app.dart';
import '../widget/app_error.dart';
import '../widget/inherited_dependencies.dart';
import 'dependencies.dart';

final class AppRunner implements IAppRunner {
  AppRunner(this.env);

  final String env;

  @override
  Future<Dependencies> preloadData() async {
    WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = AppBlocObserver();

    final Dependencies dependencies = Dependencies();

    dependencies.init(env);

    return dependencies;
  }

  @override
  Future<void> run() async {
    try {
      preloadData().then(
        (dependencies) => runApp(
          InheritedDependencies(
            dependencies: dependencies,
            child: const App(),
          ),
        ),
      );
    } catch (error, stackTrace) {
      logger.e('$runtimeType', error: error, stackTrace: stackTrace);
      runApp(AppError(e: error));
    }
  }
}
