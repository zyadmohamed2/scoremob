import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:intl/intl.dart';
import 'package:scoremob/config.dart';

import '../view/res/strings.dart';

Future<String> getDeviceTimeZone() async {
  final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
  if (kDebugMode) {
    debugPrint('device timezone : $currentTimeZone');
  }
  return currentTimeZone;
}

DateTime getFixtureStartDate(DateTime startDay,
    {int range = FIXTURES_DATE_RANGE}) {
  var date = startDay.subtract(Duration(days: range));
  return DateUtils.dateOnly(date);
}

DateTime getFixtureEndDate(DateTime startDay,
    {int range = FIXTURES_DATE_RANGE}) {
  var date = startDay.add(Duration(days: range));
  return DateUtils.dateOnly(date);
}

bool shouldShowSummerTransfers({DateTime? todayDate}) {
  var today = DateUtils.dateOnly(todayDate ?? DateTime.now());
  var summerDate = SUMMER_TRANSFER_WINDOW.copyWith(year: today.year);
  var diff = summerDate.difference(today);

  if (diff.isNegative || diff.inSeconds == 0) {
    return true;
  } else {
    return false;
  }
}

extension DateTimeConvert on String {
  DateTime toDateTime() {
    return DateTime.parse(this).toLocal();
  }

  DateTime? fromYYYYMMDD() {
    try {
      var array = split('-');
      var year = int.parse(array[0]);
      var month = int.parse(array[1]);
      var day = int.parse(array[2]);

      return DateTime(year, month, day);
    } catch (e) {
      debugPrint(e.toString());
    }

    return null;
  }
}

extension DateTimeFormats on DateTime {
  String formatYYY_MM_DD() {
    return DateFormat('yyyy-MM-dd').format(this.toLocal());
  }

  String formatMM_DD() {
    return DateFormat('dd MMM').format(this.toLocal());
  }

  String formatDDD_dd_mmm() {
    return DateFormat('EEE dd MMM').format(this.toLocal());
  }

  String formatHH_mm() {
    return DateFormat('HH:mm').format(this.toLocal());
  }

  String FormatDDDMMMmmYYYY() {
    // Sun, May 26, 2024
    return DateFormat('EE, MMM d, yyyy').format(this.toLocal());
  }

  String FormatDDDMMMmmYYYYHHmm() {
    // Sun, May 26, 2024, 6:45 PM
    return DateFormat('EE, MMM d, yyyy, HH:mm').format(this.toLocal());
  }

  String getTodayOrFormatted() {
    if (DateUtils.dateOnly(this) == DateUtils.dateOnly(DateTime.now())) {
      return resStrToday;
    }
    if (DateUtils.dateOnly(this.add(Duration(days: 1))) ==
        DateUtils.dateOnly(DateTime.now())) {
      return resStrYesterday;
    }
    if (DateUtils.dateOnly(this.subtract(Duration(days: 1))) ==
        DateUtils.dateOnly(DateTime.now())) {
      return resStrTomorrow;
    }

    return formatDDD_dd_mmm();
  }
}
