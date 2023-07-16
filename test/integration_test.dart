import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_adoption/main.dart';

void main() {
  testWidgets('Pet adoption integration test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.pumpAndSettle();

    await tester.tap(find
        .widgetWithText(ElevatedButton, 'Adopt')
        .first);
    await tester.pumpAndSettle();

    expect(find.text('Already Adopted'), findsOneWidget);
  });
}
