// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pengayaan_21_test/counter_page.dart';

import 'package:pengayaan_21_test/main.dart';

void main() {
  testWidgets('Test Materi Widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: CounterScreen(),
    ));

    // Verify that our counter starts at 0.
    expect(find.textContaining('Materi Widget Test'), findsOneWidget);
    expect(find.textContaining('Contoh Untuk Widget Test'), findsOneWidget);
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that our counter has incremented.

    expect(find.textContaining('Tombol Ditekan'), findsOneWidget);
  });
}
