import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tugas_12_testing/navigation_page.dart';

void main() {
  testWidgets('Navigation test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: MainPage()));

    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to the Second Page'), findsOneWidget);
  });
}
