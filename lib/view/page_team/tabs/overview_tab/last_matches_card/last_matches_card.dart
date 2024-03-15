import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/theme/cards_config.dart';

import '../../../../page_fixtures/model/fixture.dart';
import 'history_item.dart';

class LastMatchesCard extends StatelessWidget {
  LastMatchesCard({required this.fixtures, required this.teamId, super.key});

  List<Fixture> fixtures;
  int teamId;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: vPad.h, horizontal: hPad.w),
        child: Card(
            elevation: elevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(corners),
            ),
            child: Padding(
                padding: EdgeInsets.only(
                    top: 16.h, bottom: 14.h, right: 14.w, left: 14.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //todo arabic
                    Text('Last ${fixtures.length} matches',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12.sp),
                        textAlign: TextAlign.start),
                    Gap(12.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _getWidgets(fixtures),
                    ),
                  ],
                ))));
  }

  List<Widget> _getWidgets(List<Fixture> fixtures) {
    return fixtures
        .map((e) => HistoryItem(fixture: e, teamId: teamId))
        .toList();
  }
}
