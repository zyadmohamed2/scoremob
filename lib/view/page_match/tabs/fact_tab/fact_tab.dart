import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/fixture_details.dart';
import 'package:scoremob/view/page_match/tabs/fact_tab/info_card/info_card.dart';
import 'package:scoremob/view/page_match/tabs/fact_tab/man_of_match_card/man_of_match_card.dart';
import 'package:scoremob/view/page_match/tabs/fact_tab/timeline_card/events_view.dart';

class FactTab extends StatelessWidget {
  FactTab({required this.fixtureDetails, super.key});

  FixtureDetails fixtureDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff5f5f5),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          fixtureDetails.status.shouldShowManOfMatch()
              ? ManOfMatchCard(playerOfMatch: fixtureDetails.getPlayerOfMatch())
              : Gap(0),
          fixtureDetails.status.shouldShowEvents()
              ? EventsView(
                  events: fixtureDetails.events,
                  score: fixtureDetails.goals,
                  status: fixtureDetails.status,
                  homeTeamId: fixtureDetails.homeTeam.id,
                )
              : Gap(0),
          InfoCard(
              datetime: fixtureDetails.status.getFullDateTime(),
              leagueLogo: fixtureDetails.league.logo,
              leagueRound: fixtureDetails.league.round,
              referee: fixtureDetails.referee,
              venue: fixtureDetails.venue),
        ],
      ),
    );
  }
}
