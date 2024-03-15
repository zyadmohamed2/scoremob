import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoremob/config.dart';
import 'package:scoremob/view/theme/cards_config.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderView extends StatelessWidget {
  DateTime selectedDate;

  void Function(DateTime, DateTime) onDaySelected;

  CalenderView(
      {required this.selectedDate, required this.onDaySelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(corners),
      ),
      child: Container(
        height: 400.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TableCalendar(
              headerStyle: const HeaderStyle(
                  formatButtonShowsNext: false, formatButtonVisible: false),
              firstDay: DateTime.now().subtract(
                  const Duration(days: 30 * FIXTURES_DATE_PICKER_RANGE_START)),
              lastDay: DateTime.now().add(
                  const Duration(days: 30 * FIXTURES_DATE_PICKER_RANGE_END)),
              focusedDay: selectedDate,
              calendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                selectedDecoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.grey[500],
                  shape: BoxShape.circle,
                ),
              ),
              selectedDayPredicate: (date) {
                return isSameDay(selectedDate, date);
              },
              onDaySelected: onDaySelected,
              calendarBuilders: CalendarBuilders(
                selectedBuilder: (context, date, _) => Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
