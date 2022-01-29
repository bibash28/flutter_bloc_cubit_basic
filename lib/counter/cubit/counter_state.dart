part of 'counter_cubit.dart';

abstract class CounterState extends Equatable {
  final int? count;

  const CounterState({this.count});

  @override
  List<Object?> get props => [count];
}

class CounterInitial extends CounterState {
  const CounterInitial({int? count}) : super(count: count);
}

class CounterIncreased extends CounterState {
  const CounterIncreased({int? count}) : super(count: count);
}

class CounterDecreased extends CounterState {
  const CounterDecreased({int? count}) : super(count: count);
}
