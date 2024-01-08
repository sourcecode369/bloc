import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/color/color_cubit.dart';
import 'cubit/counter/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorCubit>(create: (context) => ColorCubit()),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
            colorCubit: BlocProvider.of<ColorCubit>(context),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Cubit2Cubit',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
  //   return BlocProvider<ColorCubit>(
  //     create: (context) => ColorCubit(),
  //     child: BlocProvider<CounterCubit>(
  //       create: (context) => CounterCubit(
  //         colorCubit: BlocProvider.of<ColorCubit>(context),
  //       ),
  //       child: MaterialApp(
  //         title: 'Cubit2Cubit',
  //         theme: ThemeData(
  //           colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //           useMaterial3: true,
  //         ),
  //         home: const MyHomePage(),
  //       ),
  //     ),
  //   );
  // }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorCubit, ColorState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.color,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Text(
                    'Change color!',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  onPressed: () {
                    BlocProvider.of<ColorCubit>(context).changeColor();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    return Text(
                      '${state.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Text(
                    'Increase Counter!',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).changeCounter();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
