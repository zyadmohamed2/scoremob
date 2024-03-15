import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/league.dart';
import 'package:scoremob/view/page_tournament/tournament_page.dart';
import 'package:scoremob/view/shared/widget/tournament_logo.dart';

class FixtureListHeader extends StatelessWidget {
  FixtureListHeader({required this.league, super.key});

  League league;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TournamentPage(
                    tournamentId: league.id, season: league.season)),
          );
        },
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(10.w),
              TournamentLogo(
                url: league.logo,
                size: 14,
              ),
              Gap(8.w),
              Expanded(
                child: Text(
                  league.name,
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp,
                      color: Color(0xff000000)),
                ),
              ),
            ]),
      ),
    );
  }
}
