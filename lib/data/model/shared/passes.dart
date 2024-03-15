import 'dart:convert';

class PlayerPassesDTO {
  final int? total;
  final int? key;
  final dynamic accuracy;

  PlayerPassesDTO({
    this.total,
    this.key,
    this.accuracy,
  });

  factory PlayerPassesDTO.fromRawJson(String str) =>
      PlayerPassesDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerPassesDTO.fromJson(Map<String, dynamic> json) =>
      PlayerPassesDTO(
        total: json["total"],
        key: json["key"],
        accuracy: json["accuracy"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "key": key,
        "accuracy": accuracy,
      };
}
