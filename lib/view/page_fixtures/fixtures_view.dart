import 'dart:async';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoremob/config.dart';
import 'package:scoremob/utils/date_utils.dart';
import 'package:scoremob/view/res/strings.dart';

import 'bloc/fixtures_bloc.dart';
import 'bloc/fixtures_events.dart';
import 'model/fixture_day.dart';
import 'model/tab_day.dart';
import 'widgets/calender_view.dart';
import 'widgets/list_view.dart';

class FixturesView extends StatefulWidget {
  FixturesView(
      {required this.fixtureDays,
      required this.tabDays,
      super.key,
      required this.selectedDay});

  Map<DateTime, FixtureDay> fixtureDays;
  List<TabDay> tabDays;
  DateTime selectedDay;

  @override
  State<FixturesView> createState() => _FixturesViewState();
}

class _FixturesViewState extends State<FixturesView> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: FIXTURES_REFRESH_PERIOD), (_) {
      context.read<FixturesBloc>().add(FixturesEventRefresh());
    });
  }

  @override
  Widget build(BuildContext context2) {
    return DefaultTabController(
      length: widget.tabDays.length,
      initialIndex: widget.tabDays.indexWhere(
          (element) => _equalDates(element.day, widget.selectedDay)),
      child: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              floating: true,
              stretch: false,
              elevation: 8,
              snap: false,
              titleSpacing: 24.w,
              backgroundColor: Colors.white,
              title: Text(
                resStrAppName,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
              iconTheme: IconThemeData(color: Colors.black),
              actions: [
                IconButton(
                  icon: Icon(FluentIcons.calendar_20_filled),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return CalenderView(
                          selectedDate: widget.selectedDay,
                          onDaySelected: (date, focusedDay) {
                            context2
                                .read<FixturesBloc>()
                                .add(FixturesEventChangeDate(date));
                            Navigator.pop(context);
                          },
                        );
                      },
                    );
                  },
                ),
                // IconButton(
                //   icon: Icon(FluentIcons.search_20_filled),
                //   onPressed: () {},
                // ),
              ],
              bottom: TabBar(
                isScrollable: true,
                tabs: _generateTabs(widget.tabDays),
              ),
            ),
          ];
        },
        body: TabBarView(
          children: _generateTabViews(widget.tabDays, widget.fixtureDays),
        ),
      ),
    );
  }

  List<Tab> _generateTabs(List<TabDay> tabDays) {
    return tabDays
        .map((e) => Tab(
              child: Text(
                e.day.getTodayOrFormatted(),
                style: TextStyle(color: Colors.black),
              ),
            ))
        .toList();
  }

  List<Widget> _generateTabViews(
      List<TabDay> tabDays, Map<DateTime, FixtureDay> fixtureDays) {
    return tabDays
        .map((e) => FixtureListView(fixtureDay: fixtureDays[e.day]))
        .toList();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  bool _equalDates(DateTime element, DateTime selectedDay) {
    return DateUtils.dateOnly(element) == DateUtils.dateOnly(selectedDay);
  }
}
