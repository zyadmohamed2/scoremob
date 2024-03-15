import 'package:scoremob/data/model/fixtures_response/fixture_player.dart';
import 'package:scoremob/data/model/fixtures_response/fixture_team.dart';
import 'package:scoremob/data/model/fixtures_response/player_info.dart';
import 'package:scoremob/data/model/fixtures_response/player_stats.dart';
import 'package:scoremob/view/shared/model/team.dart';

class PlayerStats {
  FixturePlayerInfoDTO? _player;
  FixturePlayerStatsDTO? _statistics;
  Team team;

  PlayerStats.fromDTO(FixturePlayerDTO? playerDTO, FixtureTeamDTO? teamDTO)
      : this._player = playerDTO?.player,
        this._statistics = playerDTO?.statistics?.firstOrNull,
        this.team = Team.fromFixtureDTO(teamDTO);

  int getRating100() {
    var res =
        ((double.tryParse(_statistics?.games?.rating ?? '') ?? 0) * 10).toInt();
    return res;
  }

  String getPhoto() {
    return _player?.photo ?? '';
  }

  int getID() {
    return _player?.id ?? 0;
  }

  String getName() {
    return _player?.name ?? '';
  }

  int? getGoals() {
    return _statistics?.goals?.total;
  }

  int? getAssists() {
    return _statistics?.goals?.assists;
  }

  int? getYellowCards() {
    return _statistics?.cards?.yellow;
  }

  int? getRedCard() {
    return _statistics?.cards?.red;
  }

  int? getMissedPenalties() {
    return _statistics?.penalty?.missed;
  }

  String getRating() {
    return _statistics?.games?.rating ?? '';
  }

  double getRatingDouble() {
    try {
      return double.parse(_statistics?.games?.rating ?? '0');
    } catch (e) {
      return 0;
    }
  }

  int getKeyPasses() {
    return _statistics?.passes?.key ?? 0;
  }

  int getTotalTackles() {
    return _statistics?.tackles?.total ?? 0;
  }

  int getBlocks() {
    return _statistics?.tackles?.blocks ?? 0;
  }

  int getInterceptions() {
    return _statistics?.tackles?.interceptions ?? 0;
  }

  int getTotalDuels() {
    return _statistics?.duels?.total ?? 0;
  }

  int getWonDuels() {
    return _statistics?.duels?.won ?? 0;
  }

  int getAttemptsDribbles() {
    return _statistics?.dribbles?.attempts ?? 0;
  }

  int getSuccessDribbles() {
    return _statistics?.dribbles?.success ?? 0;
  }

  int getPastDribbles() {
    return _statistics?.dribbles?.past ?? 0;
  }
}
