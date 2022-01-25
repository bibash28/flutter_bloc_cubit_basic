import 'package:basic_cubit/counter/counter.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
  group('Counter Cubit', () {
    test("Initial State is 0", () {
      expect(CounterCubit().state, equals(0));
    });

    blocTest<CounterCubit, int>(
      'emit[1] when increment is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.increment(),
      expect: () => [equals(1)],
    );

    blocTest<CounterCubit, int>(
      'emit-[-1] when decrement is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () => [equals(-1)],
    );
  });

  group('whenListen', () {
    test("let's mock the CounterCubit's stream", () {
      final cubit = MockCounterCubit();
      whenListen(cubit, Stream.fromIterable([0, 1, 2, 3]));
      expectLater(cubit.stream, emitsInOrder(<int>[0, 1, 2, 3]));
    });
  });
}
