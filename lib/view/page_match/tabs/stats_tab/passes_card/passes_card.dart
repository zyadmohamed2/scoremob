import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/fixture_details.dart';
import 'package:scoremob/view/page_match/tabs/stats_tab/top_stats_card/stat_bar.dart';
import 'package:scoremob/view/theme/cards_config.dart';

import '../../../../res/strings.dart';

class PassesCard extends StatelessWidget {
  PassesCard({required this.fixtureDetails, super.key});

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
                  resStrPasses,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                Gap(20.h),
                StatBar(
                    title: resStrTotalPasses,
                    homeValue: fixtureDetails.homeStats.passesTotal.toString(),
                    awayValue: fixtureDetails.awayStats.passesTotal.toString(),
                    higherValueIsHome: (fixtureDetails.homeStats.passesTotal >
                        fixtureDetails.awayStats.passesTotal)),
                Gap(14.h),
                StatBar(
                    title: resStrAccuratePasses,
                    homeValue:
                        fixtureDetails.homeStats.passesAccurate.toString(),
                    awayValue:
                        fixtureDetails.awayStats.passesAccurate.toString(),
                    higherValueIsHome:
                        (fixtureDetails.homeStats.passesAccurate >
                            fixtureDetails.awayStats.passesAccurate)),
                Gap(14.h),
                StatBar(
                    title: resStrAccuratePassesPerc,
                    homeValue: fixtureDetails.homeStats.passesAccuratePercentage
                        .toString(),
                    awayValue: fixtureDetails.awayStats.passesAccuratePercentage
                        .toString(),
                    higherValueIsHome:
                        (fixtureDetails.homeStats.passesAccuratePercentage >
                            fixtureDetails.awayStats.passesAccuratePercentage)),
                Gap(14.h),
              ]),
        ),
      ),
    );
  }
}
