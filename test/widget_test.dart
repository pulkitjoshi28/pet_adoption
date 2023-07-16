import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_adoption/views/homepage/home_page.dart';

void main() {
  testWidgets('PetListView displays pets', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    expect(find.byType(ListTile), findsWidgets);
  });
}
