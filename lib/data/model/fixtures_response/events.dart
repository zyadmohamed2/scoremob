import 'package:scoremob/data/model/fixtures_response/event_player.dart';
import 'package:scoremob/data/model/fixtures_response/event_time.dart';
import 'package:scoremob/data/model/shared/team.dart';

class EventsDTO {
  EventsDTO({
    required this.time,
    required this.team,
    required this.player,
    required this.assist,
    required this.type, //  CARD, GOAL, SUBST
    required this.detail,
    this.comments,
  });

  EventTimeDTO? time;
  TeamDTO? team;
  EventPlayerDTO? player;
  EventPlayerDTO? assist;
  String? type;
  String? detail;
  String? comments;

  EventsDTO.fromJson(Map<String, dynamic> json) {
    time = EventTimeDTO.fromJson(json['time']);
    team = TeamDTO.fromJson(json['team']);
    player = EventPlayerDTO.fromJson(json['player']);
    assist = EventPlayerDTO.fromJson(json['assist']);
    type = json['type'];
    detail = json['detail'];
    comments = json['comments'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['time'] = time?.toJson();
    _data['team'] = team?.toJson();
    _data['player'] = player?.toJson();
    _data['assist'] = assist?.toJson();
    _data['type'] = type;
    _data['detail'] = detail;
    _data['comments'] = comments;
    return _data;
  }
}
