import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterInitial(count: 0));

  void increment() => emit(CounterIncreased(count: state.count! + 1));

  void decrement() => emit(CounterDecreased(count: state.count! - 1));
}
