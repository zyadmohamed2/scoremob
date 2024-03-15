import 'dart:convert';

class PlayerShotsDTO {
  final int? total;
  final int? on;

  PlayerShotsDTO({
    this.total,
    this.on,
  });

  factory PlayerShotsDTO.fromRawJson(String str) =>
      PlayerShotsDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerShotsDTO.fromJson(Map<String, dynamic> json) => PlayerShotsDTO(
        total: json["total"],
        on: json["on"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "on": on,
      };
}
