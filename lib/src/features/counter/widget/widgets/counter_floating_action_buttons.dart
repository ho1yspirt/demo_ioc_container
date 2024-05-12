import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/data/dependencies.dart';
import '../../../../core/utils/logger.dart';
import '../../bloc/counter_bloc.dart';

class CounterFloaitingActionButtons extends StatelessWidget {
  const CounterFloaitingActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<CounterBloc, CounterState>(
          bloc: Dependencies.of(context).counterBloc,
          builder: (context, state) {
            if (state is CounterLoading) {
              return const FloatingActionButton(
                onPressed: null,
                child: CircularProgressIndicator(),
              );
            }
            return FloatingActionButton(
              onPressed: () {
                HapticFeedback.heavyImpact();
                Dependencies.of(context).counterBloc.add(const IncrementEvent(1));
              },
              child: const Icon(Icons.add),
            );
          },
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          onPressed: () {
            HapticFeedback.heavyImpact();
            logger.d(Dependencies.of(context).appConfig.host);
          },
          child: const Icon(
            Icons.print_outlined,
          ),
        ),
      ],
    );
  }
}
