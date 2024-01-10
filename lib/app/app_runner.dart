import 'dart:async';

import 'package:demo_ioc_container/app/app.dart';
import 'package:demo_ioc_container/app/app_error.dart';
import 'package:demo_ioc_container/app/ioc_container.dart';
import 'package:demo_ioc_container/core/utils/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class IAppRunner {
  Future<void> preloadData();

  Future<void> run();
}

class AppRunner implements IAppRunner {
  AppRunner(this.env);

  final String env;

  @override
  Future<void> preloadData() async {
    WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = AppBlocObserver();
  }

  @override
  Future<void> run() async {
    await preloadData();
    initializeDependencies(env).then(
      (dependencies) => runApp(
        InheritedDependencies(dependencies: dependencies, child: const App()),
      ),
      onError: (Object? e) => runApp(AppError(e: e)),
    );
  }
}
