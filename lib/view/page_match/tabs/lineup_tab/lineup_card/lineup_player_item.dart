import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/lineup.dart';
import 'package:scoremob/view/shared/widget/player_head.dart';
import 'package:scoremob/view/shared/widget/player_head_labeled.dart';

import '../../../model/lineup_player.dart';
import '../../../model/player.dart';
import '../../../model/team_colors.dart';
import 'lineup_circle.dart';

class LineupPlayerItem extends StatelessWidget {
  LineupPlayerItem({
    required this.player,
    required this.photo,
    required this.teamColors,
    this.stats,
    this.isPOTM,
    this.isSubIn,
    this.isSubOut,
    super.key,
  });

  String? photo;
  LineupPlayer player;
  TeamColors teamColors;
  PlayerStats? stats;
  bool? isPOTM;
  bool? isSubIn;
  bool? isSubOut;

  @override
  Widget build(BuildContext context) {
    if (photo == null || photo?.isEmpty == true) {
      var colors =
          player.isGoalkeeper() ? teamColors.goalkeeper : teamColors.player;
      return LineupCircle(player: player, colors: colors);
    } else {
      return _playerHead(player, photo ?? '');
    }
  }

  Widget _playerHead(LineupPlayer player, String photo) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PlayerHeadLabeled(
          url: photo,
          size: 42,
          isPOTM: isPOTM,
          rating: stats?.getRatingDouble(),
          missedPenalty: ((stats?.getMissedPenalties() ?? 0) > 0),
          goals: stats?.getGoals(),
          assists: stats?.getAssists(),
          yellowCard: ((stats?.getYellowCards() ?? 0) > 0),
          redCard: ((stats?.getRedCard() ?? 0) > 0),
          substitutedIn: isSubIn,
          substitutedOut: isSubOut,
        ),
        Gap(2.h),
        Text(
          '${player.number} ${player.name}',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 8.sp),
        )
      ],
    );
  }
}
