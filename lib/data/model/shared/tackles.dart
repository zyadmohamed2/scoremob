import 'dart:convert';

class PlayerTacklesDTO {
  final int? total;
  final int? blocks;
  final int? interceptions;

  PlayerTacklesDTO({
    this.total,
    this.blocks,
    this.interceptions,
  });

  factory PlayerTacklesDTO.fromRawJson(String str) =>
      PlayerTacklesDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerTacklesDTO.fromJson(Map<String, dynamic> json) =>
      PlayerTacklesDTO(
        total: json["total"],
        blocks: json["blocks"],
        interceptions: json["interceptions"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "blocks": blocks,
        "interceptions": interceptions,
      };
}
