import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/goals.dart';
import 'package:scoremob/view/shared/widget/club_logo.dart';

import '../../../../page_fixtures/model/fixture.dart';
import '../../../../theme/cards_config.dart';

class MatchSmallCard extends StatelessWidget {
  MatchSmallCard({required this.fixture, super.key});

  Fixture fixture;

  @override
  Widget build(BuildContext context) {
    var size = 20.0;
    var homeLogo = fixture.homeTeam.logo;
    var awayLogo = fixture.awayTeam.logo;
    var homeName = fixture.homeTeam.getShortName();
    var awayName = fixture.awayTeam.getShortName();
    var result = fixture.goals.getResultEnum();

    String date = fixture.status.getShortDate();
    String score = fixture.goals.getGoalsWithPenaltiesFormattedWide();

    return Card(
      elevation: elevation - 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(corners),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8.h, bottom: 8.h, right: 8.w, left: 8.w),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClubLogo(
                    url: homeLogo,
                    size: size,
                  ),
                  Gap(12.w),
                  ClubLogo(
                    url: awayLogo,
                    size: size,
                  )
                ],
              ),
              Gap(6.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homeName,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: (result == GoalsResultEnum.AwayWon)
                          ? Color(0xff808080)
                          : Colors.black,
                      decoration: (result == GoalsResultEnum.AwayWon)
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  Gap(12.w),
                  Text(
                    awayName,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: (result == GoalsResultEnum.HomeWon)
                          ? Color(0xff808080)
                          : Colors.black,
                      decoration: (result == GoalsResultEnum.HomeWon)
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  )
                ],
              ),
              Gap(6.h),
              Text(
                score.contains('null') ? date : score,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.none,
                ),
              )
            ]),
      ),
    );
  }
}
