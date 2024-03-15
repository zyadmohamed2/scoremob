import 'dart:convert';

class PlayerBirthDTO {
  final String? date;
  final String? place;
  final String? country;

  PlayerBirthDTO({
    this.date,
    this.place,
    this.country,
  });

  factory PlayerBirthDTO.fromRawJson(String str) =>
      PlayerBirthDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerBirthDTO.fromJson(Map<String, dynamic> json) => PlayerBirthDTO(
        date: json["date"],
        place: json["place"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "place": place,
        "country": country,
      };
}
