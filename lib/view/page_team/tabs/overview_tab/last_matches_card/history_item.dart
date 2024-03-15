import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/shared/widget/club_logo.dart';

import '../../../../page_fixtures/model/fixture.dart';

class HistoryItem extends StatelessWidget {
  HistoryItem({required this.fixture, required this.teamId, super.key});

  Fixture fixture;
  int teamId;

  Color loseColor = const Color(0xffd24c43);
  Color winColor = const Color(0xff48a06c);
  Color drawColor = const Color(0xff878d93);

  @override
  Widget build(BuildContext context) {
    var color = drawColor;
    var logo = fixture.getOtherTeam(teamId).logo;
    if (fixture.getWinnerTeam()?.id == teamId) {
      color = winColor;
    }
    if (fixture.getLostTeam()?.id == teamId) {
      color = loseColor;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: color,
          ),
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
          child: Text(fixture.goals.getGoalsFormatted(),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10.sp,
                  color: Colors.white),
              textAlign: TextAlign.center),
        ),
        Gap(10.h),
        ClubLogo(
          url: logo,
          size: 22,
        )
      ],
    );
  }
}
