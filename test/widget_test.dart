import 'package:flutter_test/flutter_test.dart';

import 'package:my_first_app/main.dart';

void main() {
  testWidgets('Resume page renders', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('ประวัติการศึกษา'), findsOneWidget);
    expect(find.text('ทักษะและความสามารถ'), findsOneWidget);
    expect(find.text('พรรษนันท์ เปี่ยมยานนท์'), findsOneWidget);
  });
}