import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_team/tabs/overview_tab/stadium_card/stadium_card.dart';
import 'package:scoremob/view/page_team/tabs/overview_tab/standing_card/standing_card.dart';
import '../../../page_match/model/standing_details.dart';
import '../../model/team_fixtures.dart';
import '../../model/team_info.dart';
import 'last_matches_card/last_matches_card.dart';
import 'next_match_card/next_match_card.dart';

class OverviewTab extends StatelessWidget {
  OverviewTab(
      {required this.teamFixtures,
      required this.teamInfo,
      required this.standingDetails,
      super.key});

  TeamFixtures teamFixtures;
  TeamInfo teamInfo;
  StandingDetails standingDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff5f5f5),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          NextMatchCard(fixture: teamFixtures.getNextMatch()),
          Gap(6.h),
          LastMatchesCard(
            teamId: teamInfo.id,
            fixtures: teamFixtures.getLast5Matches(),
          ),
          Gap(6.h),
          MiniStandingCard(standings: standingDetails, teamId: teamInfo.id),
          Gap(6.h),
          StadiumCard(
            venue: teamInfo.venue,
          )
        ],
      ),
    );
  }
}
