import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/shared/widget/club_logo.dart';

import '../model/team_info.dart';

class TeamInfoView extends StatelessWidget {
  TeamInfoView({required this.team, super.key});

  TeamInfo team;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: Colors.white,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClubLogo(
              url: team.logo,
              size: 52,
            ),
            Gap(16.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  team.name,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                ),
                Text(
                  team.country,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                ),
              ],
            )
          ]),
    );
  }
}
