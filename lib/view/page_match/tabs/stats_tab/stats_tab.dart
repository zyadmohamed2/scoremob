import 'package:flutter/material.dart';
import 'package:scoremob/view/page_match/model/fixture_details.dart';
import 'package:scoremob/view/page_match/tabs/stats_tab/passes_card/passes_card.dart';
import 'package:scoremob/view/page_match/tabs/stats_tab/shots_card/shots_card.dart';
import 'package:scoremob/view/page_match/tabs/stats_tab/top_stats_card/top_stats_card.dart';

class StatsTab extends StatelessWidget {
  StatsTab({required this.fixtureDetails, super.key});

  FixtureDetails fixtureDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff5f5f5),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          TopStatsCard(
            fixtureDetails: fixtureDetails,
          ),
          ShotsCard(fixtureDetails: fixtureDetails),
          PassesCard(fixtureDetails: fixtureDetails),
        ],
      ),
    );
  }
}
