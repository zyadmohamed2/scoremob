import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/shared/widget/club_logo.dart';

import '../model/league_data.dart';

class TournamentInfoView extends StatelessWidget {
  TournamentInfoView({required this.league, super.key});

  LeagueData league;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: Colors.white,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClubLogo(
              url: league.logo,
              size: 52,
            ),
            Gap(16.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  league.name,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                ),
                Text(
                  league.country.name,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                ),
              ],
            )
          ]),
    );
  }
}
