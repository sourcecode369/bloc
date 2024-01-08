import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    // on<IncrementEvent>(_incrementCountEvent, transformer: concurrent());
    // // on<DecrementEvent>(_decrementCountEvent, transformer: restartable());
    // // on<DecrementEvent>(_decrementCountEvent, transformer: sequential());
    // // on<DecrementEvent>(_decrementCountEvent, transformer: concurrent());
    // // on<DecrementEvent>(_decrementCountEvent, transformer: droppable());
    // on<DecrementEvent>(_decrementCountEvent, transformer: concurrent());

    on<CounterEvent>(
      {
        (event, emit) async {
          if (event is IncrementEvent) {
            await _incrementCountEvent(event, emit);
          } else if (event is DecrementEvent) {
            await _decrementCountEvent(event, emit);
          }
        },
      } as EventHandler<CounterEvent, CounterState>,
      transformer: sequential(),
    );
  }

  Future<void> _incrementCountEvent(event, emit) async {
    await Future.delayed(const Duration(seconds: 4));
    emit(state.copyWith(counter: state.counter + 1));
  }

  Future<void> _decrementCountEvent(event, emit) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(counter: state.counter - 1));
  }
}
