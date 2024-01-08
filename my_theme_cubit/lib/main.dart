import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit/theme_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
        create: (context) => ThemeCubit(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: BlocProvider.of<ThemeCubit>(context).state.appTheme ==
                      AppTheme.darkTheme
                  ? ThemeData.dark()
                  : ThemeData.light(),
              home: const MyHomePage(),
            );
          },
        )
        // child: Builder(builder: (context) {
        //   return MaterialApp(
        //     title: 'Flutter Demo',
        //     debugShowCheckedModeBanner: false,
        //     theme:
        //         context.watch<ThemeCubit>().state.appTheme == AppTheme.darkTheme
        //             ? ThemeData.dark()
        //             : ThemeData.light(),
        //     home: const MyHomePage(),
        //   );
        // }),
        );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FloatingActionButton(
          onPressed: () {
            final int randInt = Random().nextInt(10);
            // context.read<ThemeCubit>().changeTheme(randInt);
            BlocProvider.of<ThemeCubit>(context).changeTheme(randInt);
          },
          child: Text(
            "Click Me!",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}
