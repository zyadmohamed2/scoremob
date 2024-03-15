import 'dart:convert';

class PlayerFoulsDTO {
  final int? drawn;
  final int? committed;

  PlayerFoulsDTO({
    this.drawn,
    this.committed,
  });

  factory PlayerFoulsDTO.fromRawJson(String str) =>
      PlayerFoulsDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerFoulsDTO.fromJson(Map<String, dynamic> json) => PlayerFoulsDTO(
        drawn: json["drawn"],
        committed: json["committed"],
      );

  Map<String, dynamic> toJson() => {
        "drawn": drawn,
        "committed": committed,
      };
}
