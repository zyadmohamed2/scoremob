import 'package:scoremob/data/model/fixtures_response/events.dart';

import 'event_player.dart';
import 'event_team.dart';
import 'event_time.dart';
import 'event_type.dart';

class Event {
  EventTime time;
  EventTeam team;
  EventPlayer player; //  out in sub events
  EventPlayer assist; // in in sub events
  String detail;
  String comments;
  EventTypesEnum? type;

  Event.fromDTO(EventsDTO? dto)
      : this.time = EventTime.fromDTO(dto?.time),
        this.team = EventTeam.fromDTO(dto?.team),
        this.player = EventPlayer.fromDTO(dto?.player),
        this.assist = EventPlayer.fromDTO(dto?.assist),
        this.detail = dto?.detail ?? '',
        this.comments = dto?.comments ?? '' {
    this.type = _parseType(dto?.type);
  }

  EventTypesEnum? _parseType(String? type) {
    return EventTypesEnum.values
        .where((element) => element.name.toLowerCase() == type?.toLowerCase())
        .firstOrNull;
  }

  EventType? getTypeDetails() {
    switch (this.type) {
      case EventTypesEnum.Goal:
        return EventTypeGoal(this.detail);
      case EventTypesEnum.Card:
        return EventTypeCard(this.detail);
      case EventTypesEnum.Subst:
        return EventTypeSub(this.detail);
      case EventTypesEnum.Var:
        return EventTypeVAR(this.detail);
      case null:
        return null;
    }
  }

  bool isPenaltyShootout() {
    return time.getHalf(comments) == EventTimeEnum.penalties;
  }
}
