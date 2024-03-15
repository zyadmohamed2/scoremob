import 'dart:convert';

import 'package:scoremob/data/model/standings_response/standing.dart';

class StandingsLeagueDTO {
  final int? id;
  final String? name;
  final String? country;
  final String? logo;
  final String? flag;
  final int? season;
  final List<List<StandingDTO>>? standings;

  StandingsLeagueDTO({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
    this.standings,
  });

  factory StandingsLeagueDTO.fromRawJson(String str) =>
      StandingsLeagueDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StandingsLeagueDTO.fromJson(Map<String, dynamic> json) =>
      StandingsLeagueDTO(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        flag: json["flag"],
        season: json["season"],
        standings: json["standings"] == null
            ? []
            : List<List<StandingDTO>>.from(json["standings"]!.map((x) =>
                List<StandingDTO>.from(x.map((x) => StandingDTO.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
        "standings": standings == null
            ? []
            : List<dynamic>.from(standings!
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}
