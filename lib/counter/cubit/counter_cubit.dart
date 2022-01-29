import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(const CounterInitial(count: 0));

  void increment() => emit(CounterIncreased(count: state.count! + 1));

  void decrement() => emit(CounterDecreased(count: state.count! - 1));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterInitial(count: json['count'] as int);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return <String, dynamic>{'count': state.count};
  }
}
