import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoremob/view/page_match/model/fixture_details.dart';
import 'package:scoremob/view/shared/widget/club_logo.dart';

class ScoreViewMini extends StatelessWidget {
  ScoreViewMini({required this.fixtureDetails, super.key});

  FixtureDetails fixtureDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClubLogo(url: fixtureDetails.homeTeam.logo, size: 22),
        // Gap(24.w),
        Text(
          fixtureDetails.getScoreOrTimeAlt(),
          style: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500),
        ),
        // Gap(24.w),

        ClubLogo(url: fixtureDetails.awayTeam.logo, size: 22),
      ],
    );
  }
}
