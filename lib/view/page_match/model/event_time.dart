import 'package:scoremob/data/model/fixtures_response/event_time.dart';

class EventTime {
  int elapsed;
  int? extra;

  EventTime({required this.elapsed, this.extra});

  EventTime.fromDTO(EventTimeDTO? dto)
      : this.elapsed = dto?.elapsed ?? 0,
        this.extra = dto?.extra;

  int getTotalTime() {
    return elapsed + (extra ?? 0);
  }

  String getFormatted() {
    var temp = (extra == null) ? '' : '+$extra';
    return '$elapsed' + temp;
  }

  EventTimeEnum getHalf(String comments) {
    if (comments.toLowerCase() == "Penalty Shootout".toLowerCase()) {
      return EventTimeEnum.penalties;
    }

    if (elapsed >= 91 || (elapsed == 90 && extra == null)) {
      return EventTimeEnum.extraTime;
    }

    if (elapsed >= 46 || (elapsed == 45 && extra == null)) {
      return EventTimeEnum.secondHalf;
    }

    return EventTimeEnum.firstHalf;
  }
  // bool isFirstHalf() {
  //   if (elapsed==45 && extra!=null) {
  //     return true ;
  //   }
  //   return elapsed<45;
  // }
  //
  // bool isSecondHalf() {
  //   if (elapsed==45 && extra!=null) {
  //     return false ;
  //   }
  //   return elapsed>=45;
  // }
  //
  // bool isExtraTime() {
  //   if (elapsed==90 && extra!=null) {
  //     return false ;
  //   }
  //   return elapsed>=45;
  // }

  // int _getHalf() {
  //   return (elapsed < 45) ? 1 : 2;
  // }
}

enum EventTimeEnum { firstHalf, secondHalf, extraTime, penalties }
