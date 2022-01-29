import 'package:basic_cubit/app/app.dart';
import 'package:basic_cubit/counter/counter.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helper/pump_app.dart';

class MockCounterCubit extends MockCubit<CounterState> implements CounterCubit {
}

class MockThemeModeCubit extends MockCubit<ThemeMode>
    implements ThemeModeCubit {}

void main() {
  group('CounterPage', () {
    testWidgets('renders CounterView', (tester) async {
      await tester.pumpApp(const CounterPage());
      expect(find.byType(CounterView), findsOneWidget);
    });
  });

  group('CounterView', () {
    late ThemeModeCubit themeModeCubit;
    late CounterCubit counterCubit;

    setUp(() {
      themeModeCubit = ThemeModeCubit();
      counterCubit = MockCounterCubit();
    });

    testWidgets("Renders current count", (tester) async {
      const state = CounterInitial(count: 32);
      when(() => counterCubit.state).thenReturn(state);
      await tester.pumpApp(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: themeModeCubit),
            BlocProvider.value(value: counterCubit)
          ],
          child: const CounterView(),
        ),
      );
      expect(find.text('${state.count}'), findsOneWidget);
    });

    testWidgets("Calls increment when increment button is required",
        (tester) async {
      when(() => counterCubit.state).thenReturn(const CounterInitial(count: 0));
      when(() => counterCubit.increment()).thenReturn(null);
      await tester.pumpApp(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: themeModeCubit),
            BlocProvider.value(value: counterCubit)
          ],
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.plus_one));
      verify(() => counterCubit.increment()).called(1);
    });

    testWidgets('calls decrement when decrement button is tapped',
        (tester) async {
      when(() => counterCubit.state)
          .thenReturn(const CounterInitial(count: 32));
      when(() => counterCubit.decrement()).thenReturn(null);
      await tester.pumpApp(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: themeModeCubit),
            BlocProvider.value(value: counterCubit)
          ],
          child: const CounterView(),
        ),
      );
      await tester.tap(find.byIcon(Icons.exposure_minus_1));
      verify(() => counterCubit.decrement()).called(1);
    });
  });
}
