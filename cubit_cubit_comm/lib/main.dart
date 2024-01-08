import 'package:cubit_cubit_comm/cubit/color/color_cubit.dart';
import 'package:cubit_cubit_comm/cubit/counter/counter_cubit.dart';
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
        BlocProvider<ColorCubit>(create: (context) => ColorCubit()),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit())
      ],
      child: MaterialApp(
        title: 'Cubit2CubitBuilder',
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
    return BlocConsumer<ColorCubit, ColorState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          incrementSize = 1;
        } else if (state.color == Colors.green) {
          incrementSize = 10;
        } else if (state.color == Colors.blue) {
          incrementSize = 100;
        } else if (state.color == Colors.amber) {
          incrementSize = -10;
        } else {
          incrementSize = -100;
        }
      },
      builder: (context, state) {
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
                        BlocProvider.of<CounterCubit>(context)
                            .changeCounter(incrementSize);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
