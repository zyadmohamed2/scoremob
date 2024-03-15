import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/theme/cards_config.dart';
import 'package:scoremob/utils/date_utils.dart';

import '../../../../page_fixtures/model/fixture.dart';
import '../../../../page_fixtures/widgets/list_item.dart';
import '../../../../res/strings.dart';

class NextMatchCard extends StatelessWidget {
  NextMatchCard({required this.fixture, super.key});

  Fixture? fixture;

  @override
  Widget build(BuildContext context) {
    if (fixture == null) {
      return const Gap(0);
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vPad.h, horizontal: hPad.w),
      child: Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(corners),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 16.h, bottom: 14.h, right: 14.w, left: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(resStrNextMatch,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                  textAlign: TextAlign.start),
              Gap(10.h),
              Text(fixture?.status.startDateTime?.getTodayOrFormatted() ?? '',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: Colors.grey.shade800),
                  textAlign: TextAlign.start),
              Gap(6.h),
              FixtureListItem(fixtureData: fixture!),
              Gap(8.h)
            ],
          ),
        ),
      ),
    );
  }
}
