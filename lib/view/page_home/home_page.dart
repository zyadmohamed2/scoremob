import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:scoremob/view/page_following/page_following.dart';
import 'package:scoremob/view/page_home/widgets/bottom_nav_bar.dart';
import 'package:scoremob/view/page_tournament/tournament_page.dart';
import 'package:scoremob/view/res/strings.dart';
import 'package:scoremob/view/shared/widget/player_head_labeled.dart';

import '../page_fixtures/fixtures_page.dart';
import '../page_team/team_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = [
    // TournamentPage(tournamentId: 39,season:2023),
    // TeamPage(teamId: 33,leagueId: 39,season: 2023,),
    // MatchPage(fixtureId: 1038081),

    // Container(
    //   color: Colors.green,
    //   child: Center(
    //     child: PlayerHeadLabeled(
    //         url: "https://media.api-sports.io/football/players/742.png",
    //         size: 46,
    //         rating: 7,
    //         isPOTM: true,
    //         substitutedIn: true,
    //         substitutionTime: '73\'',
    //         injured: true,
    //         redCard: true,
    //         missedPenalty: true,
    //         clubLogo: "https://media.api-sports.io/football/teams/33.png"),
    //   ),
    // ),

    FixturesPage(),
    const Center(child: Text(resStrNews)),
    const Center(child: Text(resStrLeagues)),
    PageFollowing(),
    const Center(child: Text(resStrMore)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _tabs,
        ),
        bottomNavigationBar: BottomNavBar(
            selectedIndex: _selectedIndex, onItemTapped: _onItemTapped));
  }

  void _onItemTapped(int index) {
    setState(() {
      log('message');
      _selectedIndex = index;
    });
  }
}
