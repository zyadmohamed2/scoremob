import 'dart:convert';

class PlayerStatsLeagueDTO {
  final int? id;
  final String? name;
  final String? country;
  final String? logo;
  final String? flag;
  final int? season;

  PlayerStatsLeagueDTO({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
  });

  factory PlayerStatsLeagueDTO.fromRawJson(String str) =>
      PlayerStatsLeagueDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerStatsLeagueDTO.fromJson(Map<String, dynamic> json) =>
      PlayerStatsLeagueDTO(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        logo: json["logo"],
        flag: json["flag"],
        season: json["season"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "logo": logo,
        "flag": flag,
        "season": season,
      };
}
