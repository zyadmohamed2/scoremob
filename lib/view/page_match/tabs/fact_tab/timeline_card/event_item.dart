import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/event.dart';
import 'package:scoremob/view/page_match/model/event_time.dart';

import '../../../../res/strings.dart';
import '../../../model/event_type.dart';
import '../../../model/goals.dart';
import 'events/event_card_view.dart';
import 'events/event_goal_view.dart';
import 'events/event_sub_view.dart';
import 'events/event_var_view.dart';

class EventItem extends StatelessWidget {
  EventItem(
      {required this.event,
      super.key,
      required this.isHomeEvent,
      required this.score});

  Event event;
  bool isHomeEvent;
  Goals score;
  bool showTime = true;

  @override
  Widget build(BuildContext context) {
    showTime = event.time.getHalf(event.comments) != EventTimeEnum.penalties;
    List<Widget> widgets = [];
    var time = Expanded(
        flex: 1,
        child: Text(
          event.time.getFormatted(),
          textAlign: isHomeEvent ? TextAlign.start : TextAlign.end,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 11.sp),
        ));
    var item = Expanded(flex: 14, child: _getEventPerType(event, isHomeEvent));

    if (isHomeEvent) {
      widgets.addAll([
        Gap(14.w),
        showTime ? time : Gap(0),
        Gap(8.w),
        item,
        Gap(8.w),
      ]);
    } else {
      widgets.addAll([
        Gap(8.w),
        item,
        Gap(8.w),
        showTime ? time : Gap(0),
        Gap(14.w),
      ]);
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(children: widgets),
    );
  }

  Widget _getEventPerType(Event event, bool isHomeEvent) {
    switch (event.type) {
      case null:
        return Text('Null event type');
      case EventTypesEnum.Goal:
        return EventGoalView(
            playerName: event.player.name,
            isHome: isHomeEvent,
            goalType: EventTypeGoal(event.detail),
            assistName: event.assist.name,
            score: score);
      case EventTypesEnum.Card:
        return EventCardView(
          isHome: isHomeEvent,
          cardType: EventTypeCard(event.detail).cardType,
          playerName: event.player.name,
          reason: event.comments,
        );
      case EventTypesEnum.Subst:
        return EventSubView(
            isHome: isHomeEvent,
            inPlayer: event.assist.name,
            outPlayer: event.player.name);
      case EventTypesEnum.Var:
        return EventVarView(
          isHome: isHomeEvent,
          reason: event.detail,
        );
    }
  }
}
