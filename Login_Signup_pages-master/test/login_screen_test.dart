import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled3/LoginScreen.dart';
import 'package:untitled3/CatFoodType.dart';

void main() {
  testWidgets('LoginScreen UI test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    expect(find.text('ยินดีต้อนรับ!'), findsOneWidget);

    expect(find.byType(TextFormField), findsNWidgets(2));

    await tester.enterText(find.byType(TextFormField).first, 'ทดสอบ@gmail.com');
    await tester.pump();

    await tester.enterText(find.byType(TextFormField).last, '123');
    await tester.pump();

    await tester.tap(find.text('ลงชื่อเข้าใช้'));
    await tester.pump();

    expect(find.text('กรุณากรอกอีเมลเป็นภาษาอังกฤษ'), findsOneWidget);
    expect(find.text('รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).first, 'test@gmail.com');
    await tester.enterText(find.byType(TextFormField).last, '123456');
    await tester.pump();

    await tester.tap(find.text('ลงชื่อเข้าใช้'));
    await tester.pumpAndSettle();

    expect(find.byType(CatFoodType), findsOneWidget);
  });
}
