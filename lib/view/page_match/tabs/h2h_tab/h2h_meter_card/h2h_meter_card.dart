import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/h2h_data.dart';
import 'package:scoremob/view/page_match/tabs/h2h_tab/h2h_meter_card/h2h_meter.dart';
import 'package:scoremob/view/page_match/tabs/h2h_tab/h2h_meter_card/h2h_wins_stat.dart';
import 'package:scoremob/view/page_match/tabs/h2h_tab/h2h_meter_card/stat_header_logo.dart';

import '../../../../res/strings.dart';

class H2hMeterCard extends StatelessWidget {
  H2hMeterCard(
      {required this.homeLogo,
      required this.awayLogo,
      required this.h2hDetails,
      super.key});

  H2hData h2hDetails;
  String homeLogo;
  String awayLogo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 16.h, bottom: 12.h, right: 14.w, left: 14.w),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StatHeaderLogo(
                    title: resStrPreviousMatches,
                    homeLogo: homeLogo,
                    awayLogo: awayLogo),
                Gap(20.h),
                H2hMeter(
                    homeWins: h2hDetails.homeWins,
                    awayWins: h2hDetails.awayWins,
                    draws: h2hDetails.draws),
                Gap(24.h),
                H2hWinsStat(
                    homeWins: h2hDetails.homeWins,
                    awayWins: h2hDetails.awayWins,
                    draws: h2hDetails.draws),
              ]),
        ),
      ),
    );
  }
}
