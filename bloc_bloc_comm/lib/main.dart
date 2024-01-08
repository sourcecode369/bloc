import 'package:cubit_cubit_comm/bloc/bloc/color_bloc.dart';
import 'package:cubit_cubit_comm/bloc/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(create: (context) => ColorBloc()),
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(
            colorBloc: context.read<ColorBloc>(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Bloc2Bloc',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int incrementSize = 1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBloc, ColorState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: BlocProvider.of<ColorBloc>(context).state.color,
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
                    BlocProvider.of<ColorBloc>(context).add(ChangeColorEvent());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    return Text(
                      '${BlocProvider.of<CounterBloc>(context).state.counter}',
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
                    BlocProvider.of<CounterBloc>(context)
                        .add(ChangeCounterEvent());
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
