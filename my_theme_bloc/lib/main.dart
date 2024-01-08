import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      // child: BlocBuilder<ThemeBloc, ThemeState>(
      //   builder: (context, state) {
      //     return MaterialApp(
      //       title: 'Flutter Demo',
      //       debugShowCheckedModeBanner: false,
      //       theme: state.appTheme == AppTheme.dark
      //           ? ThemeData.dark()
      //           : ThemeData.light(),
      //       home: const MyHomePage(),
      //     );
      //   },
      // ),
      child: Builder(builder: (context) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: context.watch<ThemeBloc>().state.appTheme == AppTheme.dark
              ? ThemeData.dark()
              : ThemeData.light(),
          home: const MyHomePage(),
        );
      }),
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
            // BlocProvider.of<ThemeBloc>(context)
            //     .add(ChangeThemeEvent(randInt: randInt));
            context.read<ThemeBloc>().add(ChangeThemeEvent(randInt: randInt));
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
