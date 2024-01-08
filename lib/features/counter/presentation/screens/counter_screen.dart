import 'package:demo_ioc_container/app/ioc_container.dart';
import 'package:demo_ioc_container/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:demo_ioc_container/features/counter/presentation/widgets/counter_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Dependencies.of(context).container.counterBloc;
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(title: const Text('Counter')),
        body: const Center(child: CounterBody()),
        floatingActionButton: FloatingActionButton(
          onPressed: () => bloc.add(const IncrementEvent(1)),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
