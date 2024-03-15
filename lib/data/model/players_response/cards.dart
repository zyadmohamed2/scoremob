import 'dart:convert';

class PlayerCardsDTO {
  final int? yellow;
  final int? yellowred;
  final int? red;

  PlayerCardsDTO({
    this.yellow,
    this.yellowred,
    this.red,
  });

  factory PlayerCardsDTO.fromRawJson(String str) =>
      PlayerCardsDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerCardsDTO.fromJson(Map<String, dynamic> json) => PlayerCardsDTO(
        yellow: json["yellow"],
        yellowred: json["yellowred"],
        red: json["red"],
      );

  Map<String, dynamic> toJson() => {
        "yellow": yellow,
        "yellowred": yellowred,
        "red": red,
      };
}
