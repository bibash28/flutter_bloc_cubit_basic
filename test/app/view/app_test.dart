import 'package:basic_cubit/app/app.dart';
import 'package:basic_cubit/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter App', () {
    testWidgets("Renders Counter App", (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
