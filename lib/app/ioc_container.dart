import 'package:demo_ioc_container/app/app_config.dart';
import 'package:demo_ioc_container/features/counter/data/datasources/counter_data_source.dart';
import 'package:demo_ioc_container/features/counter/data/repositories/counter_repository.dart';
import 'package:demo_ioc_container/features/counter/domain/repositories/i_counter_repository.dart';
import 'package:demo_ioc_container/features/counter/domain/usecases/counter_usecase.dart';
import 'package:demo_ioc_container/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class DependencyContainer {
//   ICounterDataSource get counterDataSource => CounterDataSource();
//   ICounterRepository get counterRepository => CounterRepository(counterDataSource);
//   ICounterUseCase get counterUseCase => CounterUseCase(counterRepository);
//   CounterBloc get counterBloc => CounterBloc(counterUseCase);
// }

//? Am I stupid?
// class DependencyContainer {
//   ICounterDataSource? _counterDataSource;
//   ICounterRepository? _counterRepository;
//   ICounterUseCase? _counterUseCase;
//   CounterBloc? _counterBloc;

//   ICounterDataSource get counterDataSource {
//     _counterDataSource ??= CounterDataSource();
//     return _counterDataSource!;
//   }

//   ICounterRepository get counterRepository {
//     _counterRepository ??= CounterRepository(counterDataSource);
//     return _counterRepository!;
//   }

//   ICounterUseCase get counterUseCase {
//     _counterUseCase ??= CounterUseCase(counterRepository);
//     return _counterUseCase!;
//   }

//   CounterBloc get counterBloc {
//     _counterBloc ??= CounterBloc(counterUseCase);
//     return _counterBloc!;
//   }
// }

class Dependencies {
  Dependencies(this.env);

  final String env;

  factory Dependencies.of(BuildContext context) =>
      InheritedDependencies.of(context);

  late final AppConfig appConfig;
  late final SharedPreferences sharedPreferences;
  late final ICounterDataSource counterDataSource;
  late final ICounterRepository counterRepository;
  late final ICounterUseCase counterUseCase;
  late final CounterBloc counterBloc;
}

class InheritedDependencies extends InheritedWidget {
  const InheritedDependencies({
    super.key,
    required super.child,
    required this.dependencies,
  });

  final Dependencies dependencies;

  static Dependencies? maybeOf(BuildContext context) => (context
          .getElementForInheritedWidgetOfExactType<InheritedDependencies>()
          ?.widget as InheritedDependencies?)
      ?.dependencies;

  static Never _notFoundInheritedWidgetOfExactType() => throw ArgumentError(
        'Out of scope, not found inherited widget '
            'a InheritedDependencies of the exact type',
        'out_of_scope',
      );

  static Dependencies of(BuildContext context) =>
      maybeOf(context) ?? _notFoundInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(InheritedDependencies oldWidget) {
    // return dependencies != oldWidget.dependencies;
    return false;
  }
}

Future<Dependencies> initializeDependencies(String env) async {
  AppConfig appConfig;

  switch (env) {
    case 'prod':
      appConfig = ProdAppConfig();
    case 'dev':
      appConfig = DevAppConfig();
    case 'test':
      appConfig = TestAppConfig();
    default:
      appConfig = DevAppConfig();
  }

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  ICounterDataSource counterDataSource = CounterDataSource(sharedPreferences);
  ICounterRepository counterRepository = CounterRepository(counterDataSource);
  ICounterUseCase counterUseCase = CounterUseCase(counterRepository);
  CounterBloc counterBloc = CounterBloc(counterUseCase);

  return Dependencies(env)
    ..appConfig = appConfig
    ..sharedPreferences = sharedPreferences
    ..counterDataSource = counterDataSource
    ..counterRepository = counterRepository
    ..counterUseCase = counterUseCase
    ..counterBloc = counterBloc;
}
