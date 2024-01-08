import 'package:demo_ioc_container/features/counter/data/datasources/counter_data_source.dart';
import 'package:demo_ioc_container/features/counter/data/repositories/counter_repository.dart';
import 'package:demo_ioc_container/features/counter/domain/repositories/i_counter_repository.dart';
import 'package:demo_ioc_container/features/counter/domain/usecases/counter_usecase.dart';
import 'package:demo_ioc_container/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

// class DependencyContainer {
//   ICounterDataSource get counterDataSource => CounterDataSource();
//   ICounterRepository get counterRepository => CounterRepository(counterDataSource);
//   ICounterUseCase get counterUseCase => CounterUseCase(counterRepository);
//   CounterBloc get counterBloc => CounterBloc(counterUseCase);
// }

//? Am I stupid?
class DependencyContainer {
  ICounterDataSource? _counterDataSource;
  ICounterRepository? _counterRepository;
  ICounterUseCase? _counterUseCase;
  CounterBloc? _counterBloc;

  ICounterDataSource get counterDataSource {
    _counterDataSource ??= CounterDataSource();
    return _counterDataSource!;
  }

  ICounterRepository get counterRepository {
    _counterRepository ??= CounterRepository(counterDataSource);
    return _counterRepository!;
  }

  ICounterUseCase get counterUseCase {
    _counterUseCase ??= CounterUseCase(counterRepository);
    return _counterUseCase!;
  }

  CounterBloc get counterBloc {
    _counterBloc ??= CounterBloc(counterUseCase);
    return _counterBloc!;
  }
}

class Dependencies extends InheritedWidget {
  const Dependencies({
    super.key,
    required this.container,
    required Widget child,
  }) : super(child: child);
  final DependencyContainer container;

  static Dependencies of(BuildContext context) {
    final Dependencies? result =
        context.dependOnInheritedWidgetOfExactType<Dependencies>();
    assert(result != null, 'No Dependencies found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(Dependencies oldWidget) {
    return container != oldWidget.container;
  }
}

class DependencyProvider extends StatelessWidget {
  const DependencyProvider({super.key, required this.app});

  final Widget app;

  @override
  Widget build(BuildContext context) {
    final container = DependencyContainer();

    return Dependencies(container: container, child: app);
  }
}
