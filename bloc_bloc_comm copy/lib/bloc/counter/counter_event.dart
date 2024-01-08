part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {}

class ChangeCounterEvent extends CounterEvent {
  int incrementSize = 1;
  ChangeCounterEvent({
    required this.incrementSize,
  });

  @override
  List<Object?> get props => [incrementSize];
}
