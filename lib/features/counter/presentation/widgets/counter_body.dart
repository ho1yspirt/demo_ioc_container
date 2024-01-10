import 'package:demo_ioc_container/app/ioc_container.dart';
import 'package:demo_ioc_container/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBody extends StatelessWidget {
  const CounterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      bloc: Dependencies.of(context).counterBloc,
      builder: (context, state) {
        if (state is CounterInitial) {
          return const Text('Try to tap on "+" button');
        }
        if (state is CounterLoading) {
          return const CircularProgressIndicator();
        }
        if (state is CounterSuccess) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have pushed the button this many times:'),
              Text(
                state.value.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          );
        }
        if (state is CounterError) {
          return ListView(
            children: [Text(state.e.toString()), Text(state.s.toString())],
          );
        }
        return const SizedBox();
      },
    );
  }
}
