import 'dart:convert';

class PlayerDTO {
  final int? id;
  final String? name;

  PlayerDTO({
    this.id,
    this.name,
  });

  factory PlayerDTO.fromRawJson(String str) =>
      PlayerDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerDTO.fromJson(Map<String, dynamic> json) => PlayerDTO(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
