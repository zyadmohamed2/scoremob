import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/utils/string_utils.dart';
import 'package:scoremob/view/page_match/model/lineup.dart';

import '../../../model/lineup_player.dart';
import '../../../model/player_colors.dart';

class LineupCircle extends StatelessWidget {
  LineupCircle({required this.player, required this.colors});

  LineupPlayer player;
  PlayerColors colors;
  double size = 30.w;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colors.primary.hexStringToColor() ?? Color(0xffffffff),
            border: Border.all(
              color: colors.border.hexStringToColor() ?? Color(0xffd2d2d2),
              width: 2.0,
            ),
          ),
          child: Center(
            child: Text(player.number.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: colors.number.hexStringToColor() ?? Color(0xff3f3f3f),
                )),
          ),
        ),
        Gap(2.h),
        Text(
          player.name,
          style: TextStyle(color: Colors.white, fontSize: 8.sp),
        )
      ],
    );
  }
}
