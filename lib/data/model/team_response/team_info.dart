import 'dart:convert';

class TeamInfoDTO {
  final int? id;
  final String? name;
  final String? code;
  final String? country;
  final int? founded;
  final bool? national;
  final String? logo;

  TeamInfoDTO({
    this.id,
    this.name,
    this.code,
    this.country,
    this.founded,
    this.national,
    this.logo,
  });

  factory TeamInfoDTO.fromRawJson(String str) =>
      TeamInfoDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeamInfoDTO.fromJson(Map<String, dynamic> json) => TeamInfoDTO(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        country: json["country"],
        founded: json["founded"],
        national: json["national"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "country": country,
        "founded": founded,
        "national": national,
        "logo": logo,
      };
}
