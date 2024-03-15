import 'package:scoremob/data/model/fixtures_response/fixture_player.dart';
import 'package:scoremob/data/model/fixtures_response/fixture_team.dart';

class FixtureTeamPlayersDTO {
  FixtureTeamDTO? team;
  List<FixturePlayerDTO?>? players;

  FixtureTeamPlayersDTO({this.team, this.players});

  FixtureTeamPlayersDTO.fromJson(Map<String, dynamic> json) {
    team = FixtureTeamDTO.fromJson(json['team']);
    players = List.from(json['players'])
        .map((e) => FixturePlayerDTO.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['team'] = team?.toJson();
    _data['players'] = players?.map((e) => e?.toJson()).toList();
    return _data;
  }
}
