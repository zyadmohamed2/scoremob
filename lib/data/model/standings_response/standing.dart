import 'dart:convert';

import 'package:scoremob/data/model/shared/team.dart';
import 'package:scoremob/data/model/standings_response/standing_stat.dart';

class StandingDTO {
  final int? rank;
  final TeamDTO? team;
  final int? points;
  final int? goalsDiff;
  final String? group;
  final String? form;
  final String? status;
  final String? description;
  final StandingStatDTO? all;
  final StandingStatDTO? home;
  final StandingStatDTO? away;
  final String? update;

  StandingDTO({
    this.rank,
    this.team,
    this.points,
    this.goalsDiff,
    this.group,
    this.form,
    this.status,
    this.description,
    this.all,
    this.home,
    this.away,
    this.update,
  });

  factory StandingDTO.fromRawJson(String str) =>
      StandingDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StandingDTO.fromJson(Map<String, dynamic> json) => StandingDTO(
        rank: json["rank"],
        team: json["team"] == null ? null : TeamDTO.fromJson(json["team"]),
        points: json["points"],
        goalsDiff: json["goalsDiff"],
        group: json["group"],
        form: json["form"],
        status: json["status"],
        description: json["description"],
        all: json["all"] == null ? null : StandingStatDTO.fromJson(json["all"]),
        home: json["home"] == null
            ? null
            : StandingStatDTO.fromJson(json["home"]),
        away: json["away"] == null
            ? null
            : StandingStatDTO.fromJson(json["away"]),
        update: json["update"],
      );

  Map<String, dynamic> toJson() => {
        "rank": rank,
        "team": team?.toJson(),
        "points": points,
        "goalsDiff": goalsDiff,
        "group": group,
        "form": form,
        "status": status,
        "description": description,
        "all": all?.toJson(),
        "home": home?.toJson(),
        "away": away?.toJson(),
        "update": update,
      };
}
