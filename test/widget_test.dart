// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scoremob/app/app.dart';

import 'package:scoremob/main.dart';
import 'package:scoremob/utils/date_utils.dart';

void main() {
  // testDiffs();
  testfromstring();
  return;
  var r = DateTime.parse("2020-02-06T14:30:00+00:00");
  var r2 = DateTime.parse("2023-12-06T20:30:00+01:00");
  print(r);
  print(r.formatHH_mm());
  print(r.FormatDDDMMMmmYYYY());
  print(r.FormatDDDMMMmmYYYYHHmm());

  print('----------------------------------------------------------------- \n');
  print(r2);
  print(r2.formatHH_mm());
  print(r2.FormatDDDMMMmmYYYY());
  print(r2.FormatDDDMMMmmYYYYHHmm());

  // print(      DateTime.now().formatDDD_dd_mmm()  );
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const App(fixturesRepository: fixturesRepository));
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}

void testfromstring() {
  print("2019-02-01"+"  result:  "+"2019-02-01".fromYYYYMMDD().toString());
  print("2019-0-0"+"  result:  "+"2019-0-0".fromYYYYMMDD().toString());
  print("2011-1-1"+"  result:  "+"2011-1-1".fromYYYYMMDD().toString());
  print("2012-12-31"+"  result:  "+"2012-12-31".fromYYYYMMDD().toString());
  print("2012-2-31"+"  result:  "+"2012-2-31".fromYYYYMMDD().toString());
  print("2012-13-2"+"  result:  "+"2012-13-2".fromYYYYMMDD().toString());

}
void testDiffs() {
  print("Today  ${shouldShowSummerTransfers()} ");
  print("01 jan ${shouldShowSummerTransfers(todayDate: DateTime(2023, 1, 1))}  ");
  print("02 feb ${shouldShowSummerTransfers(todayDate: DateTime(2021, 2, 2))}  ");
  print("02 jan ${shouldShowSummerTransfers(todayDate: DateTime(2022, 1, 2))}  ");
  print("29 may ${shouldShowSummerTransfers(todayDate: DateTime(2024, 5, 29))}  ");
  print("01 jun ${shouldShowSummerTransfers(todayDate: DateTime(2025, 6, 1))}  ");
  print("01 jul ${shouldShowSummerTransfers(todayDate: DateTime(2026, 7, 1))}  ");
  print("31 dec ${shouldShowSummerTransfers(todayDate: DateTime(2027, 12, 31))}  ");
  print("05 sep ${shouldShowSummerTransfers(todayDate: DateTime(2028, 9, 5))}  ");
  print("12 nov ${shouldShowSummerTransfers(todayDate: DateTime(2029, 11, 12))}  ");
  print("11 oct ${shouldShowSummerTransfers(todayDate: DateTime(2011, 10, 11))}  ");
}
