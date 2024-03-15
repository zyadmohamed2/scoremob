import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/event.dart';
import 'package:scoremob/view/page_match/model/event_time.dart';
import 'package:scoremob/view/shared/model/fixture_status.dart';
import 'package:scoremob/view/theme/cards_config.dart';

import '../../../model/event_type.dart';
import '../../../model/goals.dart';
import 'event_item.dart';
import 'events/event_time_view.dart';

class EventsView extends StatelessWidget {
  EventsView(
      {required this.events,
      required this.homeTeamId,
      required this.score,
      required this.status,
      super.key});

  List<Event> events;
  int homeTeamId;
  Goals score;
  FixtureStatus status;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: vPad.h, horizontal: hPad.w),
        child: Card(
            elevation: elevation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(corners),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 16.h, bottom: 14.h, right: 14.w, left: 14.w),
              child: Column(
                children: _genEvents(),
              ),
            )));
  }

  List<Widget> _genEvents() {
    List<Widget> res = [];
    bool addedHalfTime = false;
    bool addedFinalTime = false;
    bool addedExtraTime = false;
    Goals currentGaols = Goals(0, 0, null, null);

    res.add(Gap(12.h));

    // res.addAll(events.map((e) {
    //   var isHomeEvent = e.team.id == homeTeamId;
    //   return EventItem(
    //     event: e,
    //     isHomeEvent: isHomeEvent,
    //     score: score,
    //   );
    // }).toList());

    for (var element in events) {
      if ((element.time.getHalf(element.comments) ==
              EventTimeEnum.secondHalf) &&
          addedHalfTime == false) {
        res.add(EventTimeView(
            score: currentGaols.getGoalsFormatted(),
            slice: EventTimeSlices.halfTime));
        addedHalfTime = true;
      }
      if ((element.time.getHalf(element.comments) == EventTimeEnum.extraTime) &&
          addedFinalTime == false) {
        res.add(EventTimeView(
            score: currentGaols.getGoalsFormatted(),
            slice: EventTimeSlices.fullTime));
        addedFinalTime = true;
      }
      if ((element.time.getHalf(element.comments) == EventTimeEnum.penalties) &&
          addedExtraTime == false) {
        res.add(EventTimeView(
            score: currentGaols.getGoalsFormatted(),
            slice: EventTimeSlices.extraTime));
        addedExtraTime = true;
      }

      var isHomeEvent = element.team.id == homeTeamId;
      if (element.type == EventTypesEnum.Goal &&
          (element.getTypeDetails() is EventTypeGoal) &&
          (element.getTypeDetails() as EventTypeGoal).shouldCount()) {
        if (isHomeEvent) {
          if (element.isPenaltyShootout()) {
            currentGaols.pHome = (currentGaols.pHome ?? 0) + 1;
          } else {
            currentGaols.home = (currentGaols.home ?? 0) + 1;
          }
        } else {
          if (element.isPenaltyShootout()) {
            currentGaols.pAway = (currentGaols.pAway ?? 0) + 1;
          } else {
            currentGaols.away = (currentGaols.away ?? 0) + 1;
          }
        }
      }

      res.add(EventItem(
        event: element,
        isHomeEvent: isHomeEvent,
        score: currentGaols.copy(),
      ));
    }

    if (status.shouldShowFTevent()) {
      if (!addedFinalTime) {
        res.add(EventTimeView(
            score: score.getGoalsFormatted(), slice: EventTimeSlices.fullTime));
      } else {
        if (!addedExtraTime) {
          res.add(EventTimeView(
              score: score.getGoalsFormatted(),
              slice: EventTimeSlices.extraTime));
        } else {
          res.add(EventTimeView(
              score: score.getGoalsWithPenaltiesFormatted(),
              slice: EventTimeSlices.penalties));
        }
      }
    }

    res.add(Gap(12.h));
    return res;
  }
}
