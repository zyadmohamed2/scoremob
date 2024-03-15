import '../shared/team.dart';

class CareerDTO {
  final TeamDTO? team;
  final String? start;
  final String? end;

  CareerDTO({
    this.team,
    this.start,
    this.end,
  });

  factory CareerDTO.fromJson(Map<String, dynamic> json) => CareerDTO(
        team: json["team"] == null ? null : TeamDTO.fromJson(json["team"]),
        start: json["start"],
        end: json["end"],
      );

  Map<String, dynamic> toJson() => {
        "team": team?.toJson(),
        "start": start,
        "end": end,
      };
}
