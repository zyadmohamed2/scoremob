import 'dart:convert';

class PlayerGoalsDTO {
  final int? total;
  final int? conceded;
  final int? assists;
  final int? saves;

  PlayerGoalsDTO({
    this.total,
    this.conceded,
    this.assists,
    this.saves,
  });

  factory PlayerGoalsDTO.fromRawJson(String str) =>
      PlayerGoalsDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerGoalsDTO.fromJson(Map<String, dynamic> json) => PlayerGoalsDTO(
        total: json["total"],
        conceded: json["conceded"],
        assists: json["assists"],
        saves: json["saves"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "conceded": conceded,
        "assists": assists,
        "saves": saves,
      };
}
