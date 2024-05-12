import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/data/dependencies.dart';
import '../../bloc/counter_bloc.dart';

class CounterBody extends StatelessWidget {
  const CounterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      bloc: Dependencies.of(context).counterBloc,
      builder: (context, state) => switch (state) {
        CounterInitial() => const Text('Try to tap on "+" button'),
        CounterLoading() => const CircularProgressIndicator(),
        CounterSuccess() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have pushed the button this many times:'),
              Text(
                state.value.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        CounterError() => ListView(children: [
            Text(state.e.toString()),
            Text(state.s.toString()),
          ]),
        _ => const SizedBox(),
      },
    );
  }
}
