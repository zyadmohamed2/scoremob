import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/theme/cards_config.dart';

import 'info_row.dart';

class InfoCard extends StatelessWidget {
  InfoCard(
      {required this.datetime,
      required this.leagueLogo,
      required this.leagueRound,
      required this.referee,
      required this.venue,
      super.key});

  String datetime;
  String leagueLogo;
  String leagueRound;
  String venue;
  String referee;

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
              EdgeInsets.only(top: 20.h, bottom: 20.h, right: 14.w, left: 14.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoRow(text: datetime),
              Gap(16.h),
              InfoRow(
                text: leagueRound,
                logo: leagueLogo,
              ),
              Gap(16.h),
              InfoRow(
                text: venue,
                iconData: Icons.stadium_rounded,
              ),
              Gap(16.h),
              referee.isEmpty
                  ? (const Gap(0))
                  : InfoRow(
                      text: referee,
                      iconData: Icons.sports,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
