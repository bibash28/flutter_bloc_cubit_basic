import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({int? state = 0}) : super(state = state!);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

}
