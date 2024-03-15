import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/fixture_details.dart';
import 'package:scoremob/view/page_match/tabs/stats_tab/shots_card/shots_bar.dart';
import 'package:scoremob/view/page_match/tabs/stats_tab/top_stats_card/stat_bar.dart';
import 'package:scoremob/view/theme/cards_config.dart';

import '../../../../res/strings.dart';

class ShotsCard extends StatelessWidget {
  ShotsCard({required this.fixtureDetails, super.key});

  FixtureDetails fixtureDetails;

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
          padding:
              EdgeInsets.only(top: 18.h, bottom: 14.h, right: 14.w, left: 14.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  resStrShots,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                Gap(20.h),
                StatBar(
                    title: resStrTotalShots,
                    homeValue: fixtureDetails.homeStats.shotsTotal.toString(),
                    awayValue: fixtureDetails.awayStats.shotsTotal.toString(),
                    higherValueIsHome: (fixtureDetails.homeStats.shotsTotal >
                        fixtureDetails.awayStats.shotsTotal)),
                Gap(14.h),
                ShotsBar(
                  homeOffTarget: fixtureDetails.homeStats.shotsOffGoal,
                  homeOnTarget: fixtureDetails.homeStats.shotsOnGoal,
                  awayOffTarget: fixtureDetails.awayStats.shotsOffGoal,
                  awayOnTarget: fixtureDetails.awayStats.shotsOnGoal,
                ),
                Gap(14.h),
                StatBar(
                    title: resStrBlockedShots,
                    homeValue: fixtureDetails.homeStats.shotsBlocked.toString(),
                    awayValue: fixtureDetails.awayStats.shotsBlocked.toString(),
                    higherValueIsHome: (fixtureDetails.homeStats.shotsBlocked >
                        fixtureDetails.awayStats.shotsBlocked)),
                Gap(14.h),
                StatBar(
                    title: resStrShotsInsideBox,
                    homeValue:
                        fixtureDetails.homeStats.shotsInsideBox.toString(),
                    awayValue:
                        fixtureDetails.awayStats.shotsInsideBox.toString(),
                    higherValueIsHome:
                        (fixtureDetails.homeStats.shotsInsideBox >
                            fixtureDetails.awayStats.shotsInsideBox)),
                Gap(14.h),
                StatBar(
                    title: resStrShotsOutsideBox,
                    homeValue:
                        fixtureDetails.homeStats.shotsOutsideBox.toString(),
                    awayValue:
                        fixtureDetails.awayStats.shotsOutsideBox.toString(),
                    higherValueIsHome:
                        (fixtureDetails.homeStats.shotsOutsideBox >
                            fixtureDetails.awayStats.shotsOutsideBox)),
              ]),
        ),
      ),
    );
  }
}
