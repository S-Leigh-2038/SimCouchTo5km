// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:running5k/constants.dart';
import 'package:running5k/main.dart';

// pattern:
// ARRANGE, ACT, ASSERT (AAA)

void main() {
  testWidgets('Start countdown, reset/stop test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // ARRANGE
    await tester.pumpWidget(const MyRunningApp());

    // Verify that our counter starts at start time.
    expect(find.text(startTime), findsOneWidget);
    expect(find.text(endTime), findsNothing);

    // Tap the 'start' elevated button and trigger a countdown.
    // ACT
    await tester.tap(find.text(startCoundown));
    // ASSERT(s)
    expect(find.text(startTime), findsOneWidget);
    await tester.pump(const Duration(seconds: twoSeconds));
    expect(find.text(startTimeMinusTwo), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));
    expect(find.text(startTimeMinusThree), findsOneWidget);

    // Verify that our coundown is no longer start time.
    expect(find.text(startTime), findsNothing);
    await tester.tap(find.text(stopCountdown));
    await tester.pump();
  });

  // Start countdown, reset/stop, restart countdown
  testWidgets('Start countdown, reset/stop, restart countdown test',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyRunningApp());

    // Tap the 'start' elevated button and trigger a countdown.
    await tester.tap(find.text(startCoundown));
    expect(find.text(startTime), findsOneWidget);
    await tester.pump(const Duration(seconds: twoSeconds));
    expect(find.text(startTimeMinusTwo), findsOneWidget);
    await tester.pump(const Duration(seconds: twoSeconds));

    // Stop / reset countdown
    await tester.tap(find.text(stopCountdown));
    await tester.pump();
    expect(find.text(startTime), findsOneWidget);

    // Restart the countdown
    await tester.tap(find.text(startCoundown));
    await tester.pump(const Duration(seconds: twoSeconds));
    expect(find.text(startTimeMinusTwo), findsOneWidget);

    // Verify that our coundown is no longer start time.
    expect(find.text(startTime), findsNothing);
    await tester.tap(find.text(stopCountdown));
    await tester.pump(const Duration(seconds: oneSecond));
  });

  // Start countdown, pause, continue countdown
  testWidgets('Start countdown, pause, continue countdown test',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyRunningApp());

    // Tap the 'start' elevated button and trigger a countdown.
    await tester.tap(find.text(startCoundown));
    expect(find.text(startTime), findsOneWidget);
    await tester.pump(const Duration(seconds: twoSeconds));
    expect(find.text(startTimeMinusTwo), findsOneWidget);

    // Pause countdown
    await tester.tap(find.text(pauseCountdown));
    await tester.pump();
    expect(find.text(startTimeMinusTwo), findsOneWidget);

    // Start / Continue the countdown
    await tester.tap(find.text(startCoundown));
    await tester.pump(const Duration(seconds: oneSecond));
    expect(find.text(startTimeMinusThree), findsOneWidget);
    await tester.pump(const Duration(seconds: threeSeconds));
    expect(find.text(startTimeMinusSix), findsOneWidget);

    // Verify that our coundown is no longer start time.
    expect(find.text(startTime), findsNothing);
    await tester.tap(find.text(stopCountdown));
    await tester.pump(const Duration(seconds: 1));
  });

  // Start countdown, pause, reset/stop, restart countdown
  testWidgets('Start countdown, pause, reset/stop, restart countdown test',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyRunningApp());

    // Tap the 'start' elevated button and trigger a countdown.
    await tester.tap(find.text(startCoundown));
    expect(find.text(startTime), findsOneWidget);
    await tester.pump(const Duration(seconds: twoSeconds));
    expect(find.text(startTimeMinusTwo), findsOneWidget);

    // Pause countdown
    await tester.tap(find.text(pauseCountdown));
    await tester.pump();
    expect(find.text(startTimeMinusTwo), findsOneWidget);

    // Stop / reset countdown
    await tester.tap(find.text(stopCountdown));
    await tester.pump();
    expect(find.text(startTime), findsOneWidget);

    // Start / Continue the countdown
    await tester.tap(find.text(startCoundown));
    await tester.pump(const Duration(seconds: twoSeconds));
    expect(find.text(startTimeMinusTwo), findsOneWidget);
    await tester.pump(const Duration(seconds: twoSeconds));
    expect(find.text(startTimeMinusFour), findsOneWidget);

    // Verify that our coundown is no longer start time.
    expect(find.text(startTime), findsNothing);
    await tester.tap(find.text(stopCountdown));
    await tester.pump(const Duration(seconds: 1));
  });
}
