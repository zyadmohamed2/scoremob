import 'package:scoremob/data/model/fixtures_response/fixture_team.dart';
import 'package:scoremob/data/model/fixtures_response/lineup_team.dart';
import 'package:scoremob/data/model/shared/team.dart';

class Team {
  int id;
  String name;
  String logo;
  bool? winner;

  Team(this.id, this.name, this.logo);

  Team.empty()
      : this.id = 0,
        this.name = '',
        this.logo = '',
        this.winner = null;

  Team.fromDTO(TeamDTO? dto)
      : this.id = dto?.id ?? 0,
        this.name = dto?.name ?? '',
        this.logo = dto?.logo ?? '',
        this.winner = dto?.winner;

  Team.fromFixtureDTO(FixtureTeamDTO? dto)
      : this.id = dto?.id ?? 0,
        this.name = dto?.name ?? '',
        this.logo = dto?.logo ?? '',
        this.winner = null;

  Team.fromLineupDTO(LineupTeamDTO? dto)
      : this.id = dto?.id ?? 0,
        this.name = dto?.name ?? '',
        this.logo = dto?.logo ?? '',
        this.winner = null;

  String getShortName() {
    return name.trim().replaceAll(' ', '').substring(0, 3).toUpperCase();
  }
}
