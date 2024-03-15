import 'package:scoremob/data/model/coach_response/career.dart';

import '../shared/team.dart';
import 'birth.dart';

class CoachInfoDTO {
  final int? id;
  final String? name;
  final String? firstname;
  final String? lastname;
  final int? age;
  final BirthDTO? birth;
  final String? nationality;
  final dynamic height;
  final dynamic weight;
  final String? photo;
  final TeamDTO? team;
  final List<CareerDTO>? career;

  CoachInfoDTO({
    this.id,
    this.name,
    this.firstname,
    this.lastname,
    this.age,
    this.birth,
    this.nationality,
    this.height,
    this.weight,
    this.photo,
    this.team,
    this.career,
  });

  factory CoachInfoDTO.fromJson(Map<String, dynamic> json) => CoachInfoDTO(
        id: json["id"],
        name: json["name"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        age: json["age"],
        birth: json["birth"] == null ? null : BirthDTO.fromJson(json["birth"]),
        nationality: json["nationality"],
        height: json["height"],
        weight: json["weight"],
        photo: json["photo"],
        team: json["team"] == null ? null : TeamDTO.fromJson(json["team"]),
        career: json["career"] == null
            ? []
            : List<CareerDTO>.from(
                json["career"]!.map((x) => CareerDTO.fromJson(x))),
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
        "photo": photo,
        "team": team?.toJson(),
        "career": career == null
            ? []
            : List<dynamic>.from(career!.map((x) => x.toJson())),
      };
}
