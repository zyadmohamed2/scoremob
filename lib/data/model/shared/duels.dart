import 'dart:convert';

class PlayerDuelsDTO {
  final int? total;
  final int? won;

  PlayerDuelsDTO({
    this.total,
    this.won,
  });

  factory PlayerDuelsDTO.fromRawJson(String str) =>
      PlayerDuelsDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerDuelsDTO.fromJson(Map<String, dynamic> json) => PlayerDuelsDTO(
        total: json["total"],
        won: json["won"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "won": won,
      };
}
