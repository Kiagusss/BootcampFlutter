import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:tugas_12_testing/login_page.dart';

void main() {
  testWidgets('Login page test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);

    await tester.enterText(find.byType(TextField).first, 'user');
    await tester.enterText(find.byType(TextField).last, 'pass');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Login Successful'), findsOneWidget);
  });
}
