import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/tabs/stats_tab/top_stats_card/possession_bar.dart';
import 'package:scoremob/view/page_match/tabs/stats_tab/top_stats_card/stat_bar.dart';
import 'package:scoremob/view/theme/cards_config.dart';

import '../../../../res/strings.dart';
import '../../../model/fixture_details.dart';

class TopStatsCard extends StatelessWidget {
  TopStatsCard({required this.fixtureDetails, super.key});

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
                  resStrTopStats,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                Gap(20.h),
                Text(
                  resStrBallPossession,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12.sp,
                  ),
                ),
                Gap(16.h),
                PossessionBar(
                    home: fixtureDetails.homeStats.ballPossession,
                    away: fixtureDetails.awayStats.ballPossession),
                Gap(14.h),
                StatBar(
                    title: resStrExpectedGoalsXg,
                    homeValue:
                        fixtureDetails.homeStats.goalsExpected.toString(),
                    awayValue:
                        fixtureDetails.awayStats.goalsExpected.toString(),
                    higherValueIsHome: (fixtureDetails.homeStats.goalsExpected >
                        fixtureDetails.awayStats.goalsExpected)),
                Gap(14.h),
                StatBar(
                    title: resStrTotalShots,
                    homeValue: fixtureDetails.homeStats.shotsTotal.toString(),
                    awayValue: fixtureDetails.awayStats.shotsTotal.toString(),
                    higherValueIsHome: (fixtureDetails.homeStats.shotsTotal >
                        fixtureDetails.awayStats.shotsTotal)),
                Gap(14.h),
                StatBar(
                    title: resStrAccuratePasses,
                    homeValue: fixtureDetails.homeStats
                        .getAccuratePassesWithPercentage(),
                    awayValue: fixtureDetails.awayStats
                        .getAccuratePassesWithPercentage(),
                    higherValueIsHome:
                        (fixtureDetails.homeStats.passesAccurate >
                            fixtureDetails.awayStats.passesAccurate)),
                Gap(14.h),
                StatBar(
                    title: resStrFoulsCommitted,
                    homeValue: fixtureDetails.homeStats.fouls.toString(),
                    awayValue: fixtureDetails.awayStats.fouls.toString(),
                    higherValueIsHome: (fixtureDetails.homeStats.fouls >
                        fixtureDetails.awayStats.fouls)),
                Gap(14.h),
                StatBar(
                    title: resStrOffsides,
                    homeValue: fixtureDetails.homeStats.offsides.toString(),
                    awayValue: fixtureDetails.awayStats.offsides.toString(),
                    higherValueIsHome: (fixtureDetails.homeStats.offsides >
                        fixtureDetails.awayStats.offsides)),
                Gap(14.h),
                StatBar(
                    title: resStrCorners,
                    homeValue: fixtureDetails.homeStats.corners.toString(),
                    awayValue: fixtureDetails.awayStats.corners.toString(),
                    higherValueIsHome: (fixtureDetails.homeStats.corners >
                        fixtureDetails.awayStats.corners)),
              ]),
        ),
      ),
    );
  }
}
