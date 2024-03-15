import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../res/strings.dart';
import '../../model/team_fixtures.dart';
import 'matches_card/matches_card.dart';

class MatchesTab extends StatelessWidget {
  MatchesTab({required this.teamFixtures, super.key});

  TeamFixtures teamFixtures;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff5f5f5),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Gap(6.h),
          MatchesCard(title: resStrUpcomingMatches, list: teamFixtures.next),
          Gap(6.h),
          MatchesCard(
            title: resStrPastMatches,
            list: teamFixtures.last,
          )
        ],
      ),
    );
  }
}
