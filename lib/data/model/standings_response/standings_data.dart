import 'dart:convert';

import 'package:scoremob/data/model/standings_response/standings_league.dart';

class StandingsDataDTO {
  final StandingsLeagueDTO? league;

  StandingsDataDTO({
    this.league,
  });

  factory StandingsDataDTO.fromRawJson(String str) =>
      StandingsDataDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StandingsDataDTO.fromJson(Map<String, dynamic> json) =>
      StandingsDataDTO(
        league: json["league"] == null
            ? null
            : StandingsLeagueDTO.fromJson(json["league"]),
      );

  Map<String, dynamic> toJson() => {
        "league": league?.toJson(),
      };
}
