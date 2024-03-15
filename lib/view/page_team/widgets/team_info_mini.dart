import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/team_info.dart';

class TeamMiniInfoView extends StatelessWidget {
  TeamMiniInfoView({required this.team, super.key});

  TeamInfo team;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            team.name,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
