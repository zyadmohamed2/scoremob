import 'dart:convert';

class PlayerPenaltyDTO {
  final int? won;
  final int? commited;
  final int? scored;
  final int? missed;
  final int? saved;

  PlayerPenaltyDTO({
    this.won,
    this.commited,
    this.scored,
    this.missed,
    this.saved,
  });

  factory PlayerPenaltyDTO.fromRawJson(String str) =>
      PlayerPenaltyDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerPenaltyDTO.fromJson(Map<String, dynamic> json) =>
      PlayerPenaltyDTO(
        won: json["won"],
        commited: json["commited"],
        scored: json["scored"],
        missed: json["missed"],
        saved: json["saved"],
      );

  Map<String, dynamic> toJson() => {
        "won": won,
        "commited": commited,
        "scored": scored,
        "missed": missed,
        "saved": saved,
      };
}
