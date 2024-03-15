import 'package:scoremob/data/model/coach_response/coach_info.dart';

import 'coach_info.dart';

class TeamCoaches {
  CoachInfo currentCoach = CoachInfo.empty();

  TeamCoaches(this.currentCoach);

  TeamCoaches.empty() : currentCoach = CoachInfo.empty();

  TeamCoaches.fromDTO(List<CoachInfoDTO?>? dto, int teamId) {
    dto?.forEach((element) {
      element?.career?.forEach((career) {
        if (career.team?.id == teamId && career.end == null) {
          currentCoach = CoachInfo.fromDTO(element);
        }
      });
    });
  }
}
