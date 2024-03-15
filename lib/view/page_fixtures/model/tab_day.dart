import 'package:flutter/material.dart';
import 'package:scoremob/utils/date_utils.dart';
import 'package:scoremob/view/res/strings.dart';

class TabDay {
  int id;
  DateTime day;
  bool isToday = false;

  TabDay(this.id, this.day) {
    if (DateUtils.dateOnly(day) == DateUtils.dateOnly(DateTime.now())) {
      isToday = true;
    }
  }
}
