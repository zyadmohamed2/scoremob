import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/config.dart';
import 'package:scoremob/view/page_match/model/standing.dart';
import 'package:scoremob/view/page_match/model/standings_tier.dart';
import 'package:scoremob/view/shared/widget/club_logo.dart';

import '../../../../page_team/team_page.dart';

class StandingListItem extends StatelessWidget {
  StandingListItem(
      {required this.standing,
      required this.leagueId,
      required this.tiers,
      required this.season,
      super.key,
      required this.isHighlighted});

  Standing standing;
  List<StandingTier> tiers;
  int season;
  int leagueId;
  bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w300,
    );
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TeamPage(
                      teamId: standing.team.id,
                      season: season,
                      leagueId: leagueId,
                    )));
      },
      child: Container(
        color: isHighlighted ? Colors.grey.shade200 : Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _getOutcomeColor(),
            Gap(10.w),
            Expanded(
                flex: 1,
                child: Text(
                  standing.rank.toString(),
                  style: style,
                  textAlign: TextAlign.start,
                )),
            Gap(0.w),
            Expanded(
              flex: 1,
              child: ClubLogo(
                url: standing.team.logo,
                size: 22,
              ),
            ),
            Gap(8.w),
            Expanded(
                flex: 9,
                child: Text(standing.team.name,
                    style: style, textAlign: TextAlign.start)),
            Expanded(
                flex: 1,
                child: Text(standing.gamesPlayed.toString(),
                    style: style, textAlign: TextAlign.center)),
            Gap(18.w),
            Expanded(
                flex: 1,
                child: Text(standing.getGoalsDiff(),
                    style: style, textAlign: TextAlign.center)),
            Gap(18.w),
            Expanded(
                flex: 1,
                child: Text(standing.points.toString(),
                    style: style, textAlign: TextAlign.center)),
            Gap(12.w),
          ],
        ),
      ),
    );
  }

  Widget _getOutcomeColor() {
    var tier = standing.getTier(tiers);
    var color = (tier.color == Colors.transparent) ? Colors.white : tier.color;

    return Container(
      width: 2.w,
      height: 20.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(2.0),
          bottomRight: Radius.circular(2.0),
        ),
        color: color,
      ),
    );
  }
}
