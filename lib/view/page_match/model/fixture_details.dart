import 'package:scoremob/data/model/fixtures_response/fixture_data.dart';
import 'package:scoremob/data/model/fixtures_response/fixture_team_players.dart';
import 'package:scoremob/view/page_match/model/player.dart';
import 'package:scoremob/view/page_match/model/scorer.dart';
import 'package:scoremob/view/page_match/model/statistics.dart';
import 'package:scoremob/view/shared/model/fixture_status.dart';
import 'package:scoremob/view/shared/model/team.dart';

import 'event.dart';
import 'event_type.dart';
import 'goal.dart';
import 'goals.dart';
import 'league.dart';
import 'lineup.dart';

class FixtureDetails {
  final int id;
  League league;
  Team homeTeam;
  Team awayTeam;
  Goals goals;
  List<Event> events;
  List<PlayerStats> _playersWithStats = [];
  Lineup homeLineup = Lineup.empty();
  Lineup awayLineup = Lineup.empty();
  Map<int, String> playerPhotos = {};
  Statistics homeStats;
  Statistics awayStats;
  FixtureStatus status;
  String referee;
  String venue;

  FixtureDetails.empty()
      : this.id = 0,
        this.league = League.empty(),
        this.homeTeam = Team.empty(),
        this.awayTeam = Team.empty(),
        this.goals = Goals.empty(),
        this.status = FixtureStatus.empty(),
        this.events = [],
        this._playersWithStats = [],
        this.referee = '',
        this.venue = '',
        this.homeStats = Statistics.empty(),
        this.awayStats = Statistics.empty();

  FixtureDetails.fromDTO(FixtureDataDTO dto)
      : this.id = dto.fixture?.id ?? 0,
        this.league = League.fromDTO(dto.league),
        this.homeTeam = Team.fromDTO(dto.teams?.home),
        this.awayTeam = Team.fromDTO(dto.teams?.away),
        this.goals = Goals.fromDTO(dto.goals, dto.score),
        this.referee = dto.fixture?.referee ?? '',
        this.venue =
            ('${dto.fixture?.venue?.name}, ${dto.fixture?.venue?.city}'),
        this.status = FixtureStatus.fromDTO(dto.fixture),
        this.homeStats = Statistics.fromDTO(dto.statistics?.elementAtOrNull(0)),
        this.awayStats = Statistics.fromDTO(dto.statistics?.elementAtOrNull(1)),
        this.events = dto.events?.map((e) => Event.fromDTO(e)).toList() ?? [] {
    this._playersWithStats = _populatePlayersWithStats(dto?.players);
    homeLineup = Lineup.fromDTO(dto.lineups?.elementAtOrNull(0));
    awayLineup = Lineup.fromDTO(dto.lineups?.elementAtOrNull(1));
    playerPhotos = _getPlayersPhotos(this._playersWithStats);
    homeStats.getStatsFromPlayers(_playersWithStats);
    awayStats.getStatsFromPlayers(_playersWithStats);
    _sortEvents();
    _generateSubsIds(events);
  }

  String getHomeScorersFormatted() {
    return _getScorersFormatted(
      this.events.where((element) =>
          element.type == EventTypesEnum.Goal &&
          element.team.id == homeTeam.id),
    );
  }

  String getAwayScorersFormatted() {
    return _getScorersFormatted(
      this.events.where((element) =>
          element.type == EventTypesEnum.Goal &&
          element.team.id == awayTeam.id),
    );
  }

  String _getScorersFormatted(Iterable<Event> events) {
    var res = '';
    var map = _getScorers(events);
    map.forEach((key, value) {
      res += value.getFormattedText();
    });

    return res;
  }

  Map<int, Scorer> _getScorers(Iterable<Event> events) {
    var temp = Map<int, Scorer>();

    for (var element in events) {
      var goalEvent = (element.getTypeDetails() as EventTypeGoal);
      if (goalEvent.isMissedPenalty()) {
        continue;
      }
      var old = temp[element.player.id] ??
          Scorer(element.player.id, element.player.name,
              List.empty(growable: true));

      old.goals.add(Goal(element.time.getTotalTime(), goalEvent.isOwnGoal(),
          goalEvent.isPenalty()));
      temp[element.player.id] = old;
    }
    return temp;
  }

  PlayerStats? getPlayerOfMatch() {
    if (_playersWithStats.isEmpty) {
      return null;
    }
    var player = _playersWithStats.reduce((a, b) {
      return b.getRating100() > a.getRating100() ? b : a;
    });

    return player;
  }

  List<PlayerStats> _populatePlayersWithStats(
      List<FixtureTeamPlayersDTO?>? players) {
    List<PlayerStats> res = [];

    for (var team in players ?? []) {
      team.players?.forEach((player) {
        var temp = PlayerStats.fromDTO(player, team.team);
        res.add(temp);
      });
    }

    return res;
  }

  Map<int, String> _getPlayersPhotos(List<PlayerStats> playersWithStats) {
    Map<int, String> res = {};
    for (var element in playersWithStats) {
      res[element.getID()] = element.getPhoto();
    }
    return res;
  }

  String getScoreOrTime() {
    var temp = '${goals.home} - ${goals.away}';
    return temp.contains('null') ? status.getTime() : temp;
  }

  String getScoreOrTimeAlt() {
    var temp = '${goals.home}     ${status.getSmallState()}     ${goals.away}';
    return temp.contains('null') ? status.getTime() : temp;
  }

  bool lineUpAvailable() {
    return (homeLineup.startXI.isNotEmpty || awayLineup.startXI.isNotEmpty);
  }

  bool statsAvailable() {
    return (homeStats.isAvailable == true && awayStats.isAvailable);
  }

  PlayerStats? getStatForPlayer(int playerId) {
    try {
      var temp = _playersWithStats
          .firstWhere((element) => element.getID() == playerId);
      return temp;
    } catch (e) {
      return null;
    }
  }

  void _generateSubsIds(List<Event> events) {
    var ins = <int>[];
    var outs = <int>[];

    events
        .where((element) => element.type == EventTypesEnum.Subst)
        .forEach((element) {
      ins.add(element.assist.id);
      outs.add(element.player.id);
    });

    subsInIds = ins;
    subsOutIds = outs;
  }

  var subsInIds = <int>[];
  var subsOutIds = <int>[];

  void _sortEvents() {
    events.sort(
      (a, b) {
        if (a.time.elapsed == b.time.elapsed) {
          return (a.time.extra ?? 0) - (b.time.extra ?? 0);
        }
        return a.time.elapsed - b.time.elapsed;
      },
    );
  }
}
