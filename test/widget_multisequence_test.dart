import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:running5k/main.dart';

void main() {
  testWidgets('Select a run week from menu', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyRunningApp());

    // Given that the there are multiple weeks, each with their own run/walk durations
    // When I select a particular week
    // Then I will be presented with selected week number

    expect(
        (tester.widget(find.byKey(const Key('SelectionWeek')))
                as DropdownButton)
            .value,
        equals(null));

    await tester.tap(find.text('Week 1'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Week 1'), findsWidgets);

    await tester.tap(find.text('Week 2').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Week 2'), findsWidgets);

    await tester.tap(find.text('Week 3').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Week 3'), findsWidgets);

    await tester.tap(find.text('Week 4').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Week 4'), findsWidgets);

    await tester.tap(find.text('Week 5'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Week 5'), findsWidgets);

    await tester.tap(find.text('Week 6').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Week 6'), findsWidgets);

    await tester.tap(find.text('Week 7'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Week 7'), findsWidgets);

    await tester.tap(find.text('Week 8').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.text('Week 8'), findsWidgets);
  });
}
