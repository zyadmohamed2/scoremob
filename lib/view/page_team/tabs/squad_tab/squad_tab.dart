import 'package:flutter/material.dart';
import 'package:scoremob/view/page_team/tabs/squad_tab/players_card/players_card.dart';
import 'package:scoremob/view/res/strings.dart';

import '../../model/players.dart';
import '../../model/team_coaches.dart';

class SquadTab extends StatelessWidget {
  SquadTab({required this.teamCoaches, required this.players, super.key});

  TeamCoaches teamCoaches;
  Players players;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff5f5f5),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          PlayersCard(
              title: resStrCoach, players: [], coach: teamCoaches.currentCoach),
          ..._sortSections(players.positions.map((key, value) {
            return MapEntry(key, PlayersCard(title: key, players: value));
          })),
        ],
      ),
    );
  }

  List<Widget> _sortSections(Map<String, PlayersCard> param0) {
    List<Widget> res = [];
    List<Widget> keepers = [];
    List<Widget> defenders = [];
    List<Widget> mids = [];
    List<Widget> attackers = [];

    param0.forEach((key, value) {
      var added = false;
      if (key.toLowerCase().contains('goal')) {
        keepers.add(value);
        added = true;
      }
      if (key.toLowerCase().contains('defend')) {
        defenders.add(value);
        added = true;
      }
      if (key.toLowerCase().contains('mid')) {
        mids.add(value);
        added = true;
      }
      if (key.toLowerCase().contains('attack')) {
        attackers.add(value);
        added = true;
      }
      if (!added) {
        res.add(value);
      }
    });

    res.addAll(keepers);
    res.addAll(defenders);
    res.addAll(mids);
    res.addAll(attackers);
    return res;
  }
}
