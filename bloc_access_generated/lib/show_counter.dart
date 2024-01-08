import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit/counter_cubit.dart';

class ShowCounterPage extends StatelessWidget {
  const ShowCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Text(
            '${state.counter}',
            style: Theme.of(context).textTheme.headlineLarge,
          );
        },
      )),
    );
  }
}
