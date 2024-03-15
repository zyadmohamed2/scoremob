import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoremob/view/page_tournament/model/league_data.dart';

class TournamentMiniInfoView extends StatelessWidget {
  TournamentMiniInfoView({required this.league, super.key});

  LeagueData league;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            league.name,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
