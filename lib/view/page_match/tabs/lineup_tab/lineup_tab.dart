import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/fixture_details.dart';
import 'package:scoremob/view/page_match/tabs/lineup_tab/coaches_card/coaches_card.dart';
import 'package:scoremob/view/page_match/tabs/lineup_tab/lineup_card/lineup_card.dart';
import 'package:scoremob/view/page_match/tabs/lineup_tab/subs_card/subs_card.dart';

class LineupTab extends StatelessWidget {
  LineupTab({required this.fixtureDetails, super.key});

  FixtureDetails fixtureDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff5f5f5),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          LineupCard(fixtureDetails: fixtureDetails),
          (fixtureDetails.homeLineup.coach.isEmpty() &&
                  fixtureDetails.awayLineup.coach.isEmpty())
              ? Gap(0)
              : CoachesCard(
                  homeCoach: fixtureDetails.homeLineup.coach,
                  awayCoach: fixtureDetails.awayLineup.coach,
                ),
          SubsCard(fixtureDetails: fixtureDetails),
        ],
      ),
    );
  }
}
