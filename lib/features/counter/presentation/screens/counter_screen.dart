import 'package:demo_ioc_container/app/ioc_container.dart';
import 'package:demo_ioc_container/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:demo_ioc_container/features/counter/presentation/widgets/counter_body.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String env = Dependencies.of(context).appConfig.host;
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: const Center(child: CounterBody()),
      floatingActionButton: Wrap(children: [
        BlocBuilder<CounterBloc, CounterState>(
          bloc: Dependencies.of(context).counterBloc,
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () => Dependencies.of(context)
                  .counterBloc
                  .add(const IncrementEvent(1)),
              child: const Icon(Icons.add),
            );
          },
        ),
        const SizedBox(width: 8),
        FloatingActionButton(
          onPressed: () {
            if (kDebugMode) print(env);
          },
          child: const Icon(Icons.print_outlined),
        ),
      ]),
    );
  }
}
