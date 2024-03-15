import 'dart:convert';

import 'package:scoremob/data/model/shared/team.dart';

class MovementDTO {
  final TeamDTO? teamsIn;
  final TeamDTO? out;

  MovementDTO({
    this.teamsIn,
    this.out,
  });

  factory MovementDTO.fromRawJson(String str) =>
      MovementDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovementDTO.fromJson(Map<String, dynamic> json) => MovementDTO(
        teamsIn: json["in"] == null ? null : TeamDTO.fromJson(json["in"]),
        out: json["out"] == null ? null : TeamDTO.fromJson(json["out"]),
      );

  Map<String, dynamic> toJson() => {
        "in": teamsIn?.toJson(),
        "out": out?.toJson(),
      };
}
