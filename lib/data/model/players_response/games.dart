import 'dart:convert';

class PlayerGamesDTO {
  final int? appearences;
  final int? lineups;
  final int? minutes;
  final dynamic number;
  final String? position;
  final String? rating;
  final bool? captain;

  PlayerGamesDTO({
    this.appearences,
    this.lineups,
    this.minutes,
    this.number,
    this.position,
    this.rating,
    this.captain,
  });

  factory PlayerGamesDTO.fromRawJson(String str) =>
      PlayerGamesDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerGamesDTO.fromJson(Map<String, dynamic> json) => PlayerGamesDTO(
        appearences: json["appearences"],
        lineups: json["lineups"],
        minutes: json["minutes"],
        number: json["number"],
        position: json["position"],
        rating: json["rating"],
        captain: json["captain"],
      );

  Map<String, dynamic> toJson() => {
        "appearences": appearences,
        "lineups": lineups,
        "minutes": minutes,
        "number": number,
        "position": position,
        "rating": rating,
        "captain": captain,
      };
}
