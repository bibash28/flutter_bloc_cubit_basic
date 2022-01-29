import 'package:basic_cubit/counter/counter.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCounterCubit extends MockCubit<CounterState> implements CounterCubit {
}

void main() {
  group('Counter Cubit', () {
    test('Initial State is 0', () {
      expect(CounterCubit().state, equals(const CounterInitial(count: 0)));
    });

    blocTest<CounterCubit, CounterState>(
      'emit[1] when increment is called',
      build: CounterCubit.new,
      act: (cubit) => cubit.increment(),
      expect: () => [equals(const CounterIncreased(count: 1))],
    );

    blocTest<CounterCubit, CounterState>(
      'emit[-1] when decrement is called',
      build: CounterCubit.new,
      act: (cubit) => cubit.decrement(),
      expect: () => [equals(const CounterDecreased(count: -1))],
    );

    blocTest<CounterCubit, CounterState>(
      'Sequence of states',
      build: CounterCubit.new,
      act: (cubit) => cubit
        ..increment()
        ..increment()
        ..increment()
        ..decrement(),
      expect: () => const [
        CounterIncreased(count: 1),
        CounterIncreased(count: 2),
        CounterIncreased(count: 3),
        CounterDecreased(count: 2),
      ],
    );

    test("let's mock the CounterCubit's stream", () {
      final cubit = MockCounterCubit();
      whenListen(
        cubit,
        Stream.fromIterable([
          const CounterInitial(count: 0),
          const CounterIncreased(count: 1),
          const CounterDecreased(count: 0)
        ]),
      );
      expectLater(
        cubit.stream,
        emitsInOrder(
          <CounterState>[
            const CounterInitial(count: 0),
            const CounterIncreased(count: 1),
            const CounterDecreased(count: 0)
          ],
        ),
      );
    });
  });
}
