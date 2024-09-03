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
  // Test START in various states
  // oneSecond. Beginning: Start countdown
  // twoSeconds. Running: Do nothing, continue countdown
  // 3. Paused: Start from paused value
  // 4. Reset: Start countdown
  testWidgets('Press START in beginning state test',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyRunningApp());

    // oneSecond. Beginning: Start countdown
    await tester.tap(find.text(startCoundown));
    expect(find.text(startTime), findsOneWidget);
    await tester.pump(const Duration(seconds: twoSeconds));
    expect(find.text(startTimeMinusTwo), findsOneWidget);

    // Verify that our coundown is no longer 30.
    expect(find.text(startTime), findsNothing);
    await tester.tap(find.text(stopCountdown));
    await tester.pump(const Duration(seconds: oneSecond));
  });

  testWidgets('Press START in running state test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyRunningApp());

    await tester.tap(find.text(startCoundown));
    expect(find.text(startTime), findsOneWidget);
    await tester.pump(const Duration(seconds: twoSeconds));
    expect(find.text(startTimeMinusTwo), findsOneWidget);

    // twoSeconds. Running: Do nothing, continue countdown
    await tester.tap(find.text(startCoundown));
    await tester.pump(const Duration(seconds: oneSecond));
    expect(find.text(startTimeMinusThree), findsOneWidget);

    // Verify that our coundown is no longer 30.
    expect(find.text(startTime), findsNothing);
    await tester.tap(find.text(stopCountdown));
    await tester.pump(const Duration(seconds: oneSecond));
  });

  testWidgets('Press START in paused state test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyRunningApp());

    await tester.tap(find.text(startCoundown));
    expect(find.text(startTime), findsOneWidget);
    await tester.pump(const Duration(seconds: twoSeconds));
    expect(find.text(startTimeMinusTwo), findsOneWidget);
    await tester.tap(find.text(pauseCountdown));
    await tester.pump();
    expect(find.text(startTimeMinusTwo), findsOneWidget);

    // 3. Paused: Start from paused value
    await tester.tap(find.text(startCoundown));
    await tester.pump(const Duration(seconds: oneSecond));
    expect(find.text(startTimeMinusThree), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));
    expect(find.text(startTimeMinusFour), findsOneWidget);

    // Verify that our coundown is no longer 30.
    expect(find.text(startTime), findsNothing);
    await tester.tap(find.text(stopCountdown));
    await tester.pump(const Duration(seconds: oneSecond));
  });

  testWidgets('Press START in stopped state test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyRunningApp());

    await tester.tap(find.text(startCoundown));
    expect(find.text(startTime), findsOneWidget);
    await tester.pump(const Duration(seconds: twoSeconds));
    expect(find.text(startTimeMinusTwo), findsOneWidget);
    await tester.tap(find.text(stopCountdown));
    await tester.pump();
    expect(find.text(startTime), findsOneWidget);

    // 3. Paused: Start from paused value
    await tester.tap(find.text(startCoundown));
    await tester.pump();
    expect(find.text(startTime), findsOneWidget);
    await tester.pump(const Duration(seconds: twoSeconds));
    expect(find.text(startTimeMinusTwo), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));
    expect(find.text(startTimeMinusThree), findsOneWidget);

    // Verify that our coundown is no longer 30.
    expect(find.text(startTime), findsNothing);
    await tester.tap(find.text(stopCountdown));
    await tester.pump(const Duration(seconds: oneSecond));
  });
}
