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
  // Test sequence of timers is run to completion
  testWidgets('Test sequence of timers is run to completion',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyRunningApp());
    await tester.tap(find.text(startCoundown));
    await tester.pump();

    await tester.pump(const Duration(minutes: 5));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 60));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 90));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 60));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 90));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 60));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 90));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 60));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 90));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 60));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 90));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 60));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 90));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 60));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 90));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 60));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(seconds: 90));
    expect(find.text(endTime), findsOneWidget);
    await tester.pump(const Duration(seconds: oneSecond));

    await tester.pump(const Duration(minutes: 5));
    expect(find.text(endTime), findsOneWidget);
    await tester.tap(find.text(stopCountdown));
    await tester.pump();
  });
}
