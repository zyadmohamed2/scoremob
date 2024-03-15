import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/res/assets_res.dart';

import '../../../../../res/strings.dart';
import '../../../../model/event_type.dart';
import '../../../../model/goals.dart';

class EventGoalView extends StatelessWidget {
  EventGoalView(
      {required this.playerName,
      required this.isHome,
      required this.goalType,
      required this.assistName,
      required this.score,
      super.key});

  bool isHome;
  EventTypeGoal goalType;
  String playerName;
  String assistName;
  Goals score;

  @override
  Widget build(BuildContext context) {
    var icon = goalType.isMissedPenalty()
        ? Image.asset(AssetsRes.MISSED_GOAL, height: 20.h, width: 20.w)
        : Icon(
            FluentIcons.sport_soccer_16_regular,
            size: 20.h,
            color: !goalType.isOwnGoal()
                ? const Color(0xff333333)
                : const Color(0xffe55e5b),
          );
    var title = RichText(
      text: TextSpan(
        style: TextStyle(fontSize: 10.sp),
        children: _getTitleSpans(),
      ),
    );
    var subTitle = Text(
      getSubtitle(),
      style: TextStyle(fontSize: 10.sp, color: const Color(0xff636363)),
    );
    var textColumn = Column(
      crossAxisAlignment:
          isHome ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [title, subTitle],
    );

    List<Widget> list = [];

    if (isHome) {
      list.addAll([icon, Gap(14.w), textColumn]);
    } else {
      list.addAll([textColumn, Gap(14.w), icon]);
    }

    return Row(
      mainAxisAlignment:
          isHome ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: list,
    );
  }

  String getSubtitle() {
    switch (goalType.goalType) {
      case EventTypeGoalEnum.Normal:
        {
          if (assistName.isEmpty) {
            return '';
          }
          return '$resStrAssistBy $assistName';
        }
      case EventTypeGoalEnum.Own:
        return resStrOwnGoal;
      case EventTypeGoalEnum.Penalty:
        return resStrPenalty;
      case EventTypeGoalEnum.MissedPenalty:
        return resStrMissedPenalty;
    }
  }

  List<TextSpan> _getTitleSpans() {
    List<TextSpan> res = [];

    var homeScore = (score.pHome == null) ? score.home : score.pHome;
    var awayScore = (score.pAway == null) ? score.away : score.pAway;

    res.add(TextSpan(
      text: playerName,
      style: const TextStyle(color: Colors.black),
    ));

    if (goalType.isMissedPenalty()) {
      return res;
    }
    res.add(const TextSpan(
      text: ' (',
      style: TextStyle(color: Colors.black),
    ));
    res.add(TextSpan(
      text: homeScore.toString(),
      style: TextStyle(color: isHome ? Color(0xff00985f) : Colors.black),
    ));
    res.add(const TextSpan(
      text: ' - ',
      style: TextStyle(color: Colors.black),
    ));

    res.add(TextSpan(
      text: awayScore.toString(),
      style: TextStyle(color: !isHome ? Color(0xff00985f) : Colors.black),
    ));
    res.add(const TextSpan(
      text: ')',
      style: TextStyle(color: Colors.black),
    ));
    return res;
  }
}
