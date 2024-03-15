import 'dart:convert';

class PlayerStatsSubstitutesDTO {
  final int? substitutesIn;
  final int? out;
  final int? bench;

  PlayerStatsSubstitutesDTO({
    this.substitutesIn,
    this.out,
    this.bench,
  });

  factory PlayerStatsSubstitutesDTO.fromRawJson(String str) =>
      PlayerStatsSubstitutesDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerStatsSubstitutesDTO.fromJson(Map<String, dynamic> json) =>
      PlayerStatsSubstitutesDTO(
        substitutesIn: json["in"],
        out: json["out"],
        bench: json["bench"],
      );

  Map<String, dynamic> toJson() => {
        "in": substitutesIn,
        "out": out,
        "bench": bench,
      };
}
