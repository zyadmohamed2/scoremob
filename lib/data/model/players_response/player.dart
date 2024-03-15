import 'dart:convert';

import 'package:scoremob/data/model/players_response/birth.dart';

class PlayerDTO {
  final int? id;
  final String? name;
  final String? firstname;
  final String? lastname;
  final int? age;
  final PlayerBirthDTO? birth;
  final String? nationality;
  final String? height;
  final String? weight;
  final bool? injured;
  final String? photo;

  PlayerDTO({
    this.id,
    this.name,
    this.firstname,
    this.lastname,
    this.age,
    this.birth,
    this.nationality,
    this.height,
    this.weight,
    this.injured,
    this.photo,
  });

  factory PlayerDTO.fromRawJson(String str) =>
      PlayerDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerDTO.fromJson(Map<String, dynamic> json) => PlayerDTO(
        id: json["id"],
        name: json["name"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        age: json["age"],
        birth: json["birth"] == null
            ? null
            : PlayerBirthDTO.fromJson(json["birth"]),
        nationality: json["nationality"],
        height: json["height"],
        weight: json["weight"],
        injured: json["injured"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "firstname": firstname,
        "lastname": lastname,
        "age": age,
        "birth": birth?.toJson(),
        "nationality": nationality,
        "height": height,
        "weight": weight,
        "injured": injured,
        "photo": photo,
      };
}
