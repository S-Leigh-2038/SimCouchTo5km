// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:running5k/constants.dart';
import 'package:running5k/main.dart';

void main() {
  // Test PAUSE in various states
  // 1. Beginning: do nothing
  // 2. Running: pause
  // 3. Paused: do nothing
  // 4. Reset: do nothing
  testWidgets('Press PAUSE in beginning state test',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyRunningApp());

    // 1. Beginning: Start countdown
    await tester.tap(find.text(pauseCountdown));
    expect(find.text(startTime), findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
    expect(find.text(startTime), findsOneWidget);

    await tester.tap(find.text(stopCountdown));
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets('Press PAUSE in running state test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyRunningApp());

    await tester.tap(find.text(startCoundown));
    expect(find.text(startTime), findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
    expect(find.text(startTimeMinusTwo), findsOneWidget);

    // 2. Running: Do nothing, continue countdown
    await tester.tap(find.text(pauseCountdown));
    await tester.pump(const Duration(seconds: 1));
    expect(find.text(startTimeMinusTwo), findsOneWidget);

    // Verify that our coundown is no longer start time.
    expect(find.text(startTime), findsNothing);
    await tester.tap(find.text(stopCountdown));
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets('Press PAUSE in paused state test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyRunningApp());

    await tester.tap(find.text(startCoundown));
    expect(find.text(startTime), findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
    expect(find.text(startTimeMinusTwo), findsOneWidget);
    await tester.tap(find.text(pauseCountdown));
    await tester.pump();
    expect(find.text(startTimeMinusTwo), findsOneWidget);

    // 3. Paused: Start from paused value
    await tester.tap(find.text(pauseCountdown));
    await tester.pump(const Duration(seconds: 1));
    expect(find.text(startTimeMinusTwo), findsOneWidget);

    // Verify that our coundown is no longer start time.
    expect(find.text(startTime), findsNothing);
    await tester.tap(find.text(stopCountdown));
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets('Press PAUSE in stopped state test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyRunningApp());

    await tester.tap(find.text(startCoundown));
    expect(find.text(startTime), findsOneWidget);
    await tester.pump(const Duration(seconds: 2));
    expect(find.text(startTimeMinusTwo), findsOneWidget);
    await tester.tap(find.text(stopCountdown));
    await tester.pump();
    expect(find.text(startTime), findsOneWidget);

    // 3. Paused: Start from paused value
    await tester.tap(find.text(pauseCountdown));
    await tester.pump(const Duration(seconds: 2));
    expect(find.text(startTime), findsOneWidget);

    await tester.tap(find.text(stopCountdown));
    await tester.pump(const Duration(seconds: 1));
  });
}
