part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class IncrementCountEvent extends CounterEvent {}
