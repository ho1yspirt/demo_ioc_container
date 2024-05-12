// external
import 'package:demo_ioc_container/src/features/counter/domain/usecases/counter_usecase.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// internal
import '../../features/counter/data/datasources/counter_data_source.dart';
import '../../features/counter/data/repositories/counter_repository.dart';
import '../../features/counter/domain/repositories/i_counter_repository.dart';
import '../../features/counter/bloc/counter_bloc.dart';
import '../domain/i_app_config.dart';
import '../widget/inherited_dependencies.dart';
import 'app_config.dart';

final class Dependencies {
  Dependencies();

  factory Dependencies.of(BuildContext context) => InheritedDependencies.of(context);

  late final String env;
  late final IAppConfig appConfig;
  late final SharedPreferences sharedPreferences;
  late final ICounterDataSource counterDataSource;
  late final ICounterRepository counterRepository;
  late final ICounterUseCase counterUseCase;
  late final CounterBloc counterBloc;

  Future<void> init(String env) async {
    env = env;

    appConfig = switch (env) {
      'prod' => ProdAppConfig(),
      'dev' => DevAppConfig(),
      'test' => TestAppConfig(),
      _ => DevAppConfig(),
    };

    sharedPreferences = await SharedPreferences.getInstance();

    counterDataSource = CounterDataSource(sharedPreferences);
    counterRepository = CounterRepository(counterDataSource);
    counterUseCase = CounterUseCase(counterRepository);
    counterBloc = CounterBloc(counterUseCase);
  }
}
