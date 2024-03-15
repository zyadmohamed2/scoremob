import 'dart:convert';

import 'package:scoremob/data/model/standings_response/standing_stat_goal.dart';

class StandingStatDTO {
  final int? played;
  final int? win;
  final int? draw;
  final int? lose;
  final StandingStatGoals? goals;

  StandingStatDTO({
    this.played,
    this.win,
    this.draw,
    this.lose,
    this.goals,
  });

  factory StandingStatDTO.fromRawJson(String str) =>
      StandingStatDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StandingStatDTO.fromJson(Map<String, dynamic> json) =>
      StandingStatDTO(
        played: json["played"],
        win: json["win"],
        draw: json["draw"],
        lose: json["lose"],
        goals: json["goals"] == null
            ? null
            : StandingStatGoals.fromJson(json["goals"]),
      );

  Map<String, dynamic> toJson() => {
        "played": played,
        "win": win,
        "draw": draw,
        "lose": lose,
        "goals": goals?.toJson(),
      };
}
