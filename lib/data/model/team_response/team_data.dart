import 'dart:convert';

import 'package:scoremob/data/model/team_response/team_info.dart';
import 'package:scoremob/data/model/team_response/venue_info.dart';

class TeamDataDTO {
  final TeamInfoDTO? team;
  final VenueInfoDTO? venue;

  TeamDataDTO({
    this.team,
    this.venue,
  });

  factory TeamDataDTO.fromRawJson(String str) =>
      TeamDataDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeamDataDTO.fromJson(Map<String, dynamic> json) => TeamDataDTO(
        team: json["team"] == null ? null : TeamInfoDTO.fromJson(json["team"]),
        venue:
            json["venue"] == null ? null : VenueInfoDTO.fromJson(json["venue"]),
      );

  Map<String, dynamic> toJson() => {
        "team": team?.toJson(),
        "venue": venue?.toJson(),
      };
}
