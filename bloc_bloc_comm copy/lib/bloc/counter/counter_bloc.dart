import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int incrementSize = 1;

  CounterBloc() : super(CounterState.initial()) {
    // colorSubscription = colorBloc.stream.listen(
    //   (ColorState colorState) {
    //     if (colorState.color == Colors.red) {
    //       incrementSize = 1;
    //     } else if (colorState.color == Colors.green) {
    //       incrementSize = 10;
    //     } else if (colorState.color == Colors.blue) {
    //       incrementSize = 100;
    //     } else if (colorState.color == Colors.amber) {
    //       incrementSize = -10;
    //     } else {
    //       incrementSize = -100;
    //     }
    //   },
    // );

    on<ChangeCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + event.incrementSize));
    });
  }

  // @override
  // Future<void> close() {
  //   colorSubscription.cancel();
  //   return super.close();
  // }
}
