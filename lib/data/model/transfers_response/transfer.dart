import 'dart:convert';

import 'package:scoremob/data/model/transfers_response/movement.dart';

class TransferDTO {
  final String? date;
  final String? type;
  final MovementDTO? teams;

  TransferDTO({
    this.date,
    this.type,
    this.teams,
  });

  factory TransferDTO.fromRawJson(String str) =>
      TransferDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TransferDTO.fromJson(Map<String, dynamic> json) => TransferDTO(
        date: json["date"],
        type: json["type"],
        teams:
            json["teams"] == null ? null : MovementDTO.fromJson(json["teams"]),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "type": type,
        "teams": teams?.toJson(),
      };
}
