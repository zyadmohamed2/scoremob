import 'package:scoremob/data/model/fixtures_response/coach.dart';
import 'package:scoremob/data/model/fixtures_response/lineup_team.dart';
import 'package:scoremob/data/model/fixtures_response/start_xi.dart';

class LineupsDTO {
  LineupsDTO({
    required this.team,
    required this.coach,
    required this.formation,
    required this.startXI,
    required this.substitutes,
  });
  LineupTeamDTO? team;
  CoachDTO? coach;
  String? formation;
  List<StartXIDTO?>? startXI;
  List<StartXIDTO?>? substitutes;

  LineupsDTO.fromJson(Map<String, dynamic> json) {
    team = LineupTeamDTO?.fromJson(json['team']);
    coach = CoachDTO?.fromJson(json['coach']);
    formation = json['formation'];
    startXI =
        List.from(json['startXI']).map((e) => StartXIDTO.fromJson(e)).toList();
    substitutes = List.from(json['substitutes'])
        .map((e) => StartXIDTO.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['team'] = team?.toJson();
    _data['coach'] = coach?.toJson();
    _data['formation'] = formation;
    _data['startXI'] = startXI?.map((e) => e?.toJson()).toList();
    _data['substitutes'] = substitutes?.map((e) => e?.toJson()).toList();
    return _data;
  }
}
