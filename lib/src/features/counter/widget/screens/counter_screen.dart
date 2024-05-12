import 'package:flutter/material.dart';

import '../widgets/counter_body.dart';
import '../widgets/counter_floating_action_buttons.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Counter',
        ),
      ),
      body: const Center(
        child: CounterBody(),
      ),
      floatingActionButton: const CounterFloaitingActionButtons(),
    );
  }
}
