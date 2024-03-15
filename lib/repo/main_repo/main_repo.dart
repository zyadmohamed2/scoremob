import 'package:scoremob/config.dart';
import 'package:scoremob/data/model/coach_response/coach_info.dart';
import 'package:scoremob/data/model/fixtures_response/fixture_data.dart';
import 'package:scoremob/data/model/league_response/league_data.dart';
import 'package:scoremob/data/model/players_response/player_data.dart';
import 'package:scoremob/data/model/standings_response/standings_data.dart';
import 'package:scoremob/data/model/team_response/team_data.dart';
import 'package:scoremob/data/model/transfers_response/player_transfer_data.dart';
import 'package:scoremob/repo/fixtures_repo/fixtures_repo.dart';
import 'package:scoremob/repo/leagues_repo/leagues_repo.dart';
import 'package:scoremob/repo/main_repo/model/cached_standing.dart';
import 'package:scoremob/repo/main_repo/model/league_type.dart';
import 'package:scoremob/repo/teams_repo/teams_repo.dart';
import 'package:scoremob/utils/date_utils.dart';

class MainRepo {
  final FixturesRepo fixturesRepo;
  final LeaguesRepo leaguesRepo;
  final TeamsRepo teamsRepo;

  MainRepo({
    required this.fixturesRepo,
    required this.leaguesRepo,
    required this.teamsRepo,
  }) {
    timezone = getDeviceTimeZone();
  }

  Map<int, LeagueDataDTO> cachedLeagues = {};

  Map<int, Map<int, CachedStanding>> cachedStandings = {};
  late Future<String> timezone;

  Future<LeagueDataDTO?> fetchLeagueById(int leagueId) async {
    if (cachedLeagues[leagueId] != null) {
      return cachedLeagues[leagueId];
    }
    return await leaguesRepo.fetchLeaguesById(leagueId);
  }

  Future<LeagueTypeEnum> getLeagueType(int leagueId) async {
    var lType = (await fetchLeagueById(leagueId))?.league?.type?.toLowerCase();
    if (lType == LeagueTypeEnum.league.name) {
      return LeagueTypeEnum.league;
    }

    if (lType == LeagueTypeEnum.cup.name) {
      return LeagueTypeEnum.cup;
    }

    //default
    return LeagueTypeEnum.league;
  }

  Future<Map<int, List<FixtureDataDTO>>> fetchAllFixtures(
      DateTime dateFrom, DateTime dateTo) async {
    if (cachedLeagues.isEmpty) {
      cachedLeagues =
          await leaguesRepo.fetchSupportedLeagues(SUPPORTED_LEAGUES);
    }
    return await fixturesRepo.fetchByFixturesDate(
        dateFrom, dateTo, (await timezone), cachedLeagues);
  }

  Future<FixtureDataDTO?> fetchFixture(int id) async {
    return await fixturesRepo.fetchFixtureById(id, (await timezone));
  }

  Future<StandingsDataDTO?> fetchLeagueStandings(int leagueId, int season) {
    var cache = _getStandingsFromCache(leagueId, season);
    if (cache != null) {
      return Future.value(cache);
    }
    var result = leaguesRepo.fetchLeagueStandings(leagueId, season);
    _putInfoStandingsCache(result);
    return result;
  }

  Future<List<FixtureDataDTO>?> fetchH2H(int homeTeamId, int awayTeamId) async {
    return fixturesRepo.fetchH2H(homeTeamId, awayTeamId, (await timezone),
        FIXTURES_DETAILS_H2H_LAST_GAMES_FETCHED);
  }

  Future<List<FixtureDataDTO>?> fetchFixturesByRound(
      int leagueId, int season, String round) async {
    return fixturesRepo.fetchFixturesByRound(
        leagueId, season, (await timezone), round);
  }

  Future<List<FixtureDataDTO>?> fetchLastFixtureForTeam(int teamId) async {
    var gamesCount = 10;
    var games = await fixturesRepo.fetchLastFixturesByTeam(
        teamId, gamesCount, (await timezone));
    var filtered = games?.where((element) {
      return SUPPORTED_LEAGUES.contains(element.league?.id ?? 0);
    }).toList();
    // filtered?.sort(
    //   (a, b) {
    //     return ((b.fixture?.timestamp ?? 0) - (a.fixture?.timestamp ?? 0));
    //   },
    // );

    return filtered;
  }

  Future<List<FixtureDataDTO>?> fetchNextFixtureForTeam(int teamId) async {
    var gamesCount = 10;
    var games = await fixturesRepo.fetchNextFixturesByTeam(
        teamId, gamesCount, (await timezone));
    var filtered = games?.where((element) {
      return SUPPORTED_LEAGUES.contains(element.league?.id ?? 0);
    }).toList();
    // filtered?.sort(
    //   (a, b) {
    //     return ((b.fixture?.timestamp ?? 0) - (a.fixture?.timestamp ?? 0));
    //   },
    // );

    return filtered;
  }

  Future<List<PlayerDataDTO?>?> fetchTeamPlayers(int season, int teamId) async {
    return teamsRepo.fetchTeamPlayers(season, teamId);
  }

  Future<List<CoachInfoDTO?>?> fetchTeamCoaches(int teamId) async {
    return teamsRepo.fetchTeamCoaches(teamId);
  }

  Future<TeamDataDTO?> fetchTeamInfo(int teamId) async {
    return teamsRepo.fetchTeamInfo(teamId);
  }

  Future<List<PlayerTransferDataDTO?>?> fetchTeamTransfers(
      int teamId, int leagueId) async {
    var all = await teamsRepo.fetchTeamTransfersInfo(teamId);
    var limitDate = _getTransferStartingDate();
    var filtered = all?.where((element) {
      if (element == null) {
        return false;
      }
      return (_shouldShowInTransfer(element, limitDate));
    }).toList();

    filtered?.sort(
      (a, b) {
        return (a?.transfers?.firstOrNull?.date
                    ?.fromYYYYMMDD()
                    ?.millisecondsSinceEpoch ??
                0) -
            (b?.transfers?.firstOrNull?.date
                    ?.fromYYYYMMDD()
                    ?.millisecondsSinceEpoch ??
                0);
      },
    );

    return filtered;
  }

  Future<List<FixtureDataDTO>?> fetchFixturesByLeague(
      int leagueId, int season) async {
    return fixturesRepo.fetchFixturesByLeague(
        leagueId, season, (await timezone));
  }

  StandingsDataDTO? _getStandingsFromCache(int leagueId, int season) {
    var cache = cachedStandings[leagueId]?[season];
    if (cache == null || !cache.isValid()) {
      return null;
    }
    return cache.value;
  }

  void _putInfoStandingsCache(Future<StandingsDataDTO?> result) {
    result.then((value) {
      if (value != null) {
        var season = {
          (value.league?.season ?? 0): CachedStanding(value: value)
        };
        cachedStandings[value.league?.id ?? 0] = season;
      }
    });
  }

  bool _shouldShowInTransfer(
      PlayerTransferDataDTO element, DateTime limitDate) {
    var date = element.transfers?.firstOrNull?.date?.fromYYYYMMDD();
    if (date != null) {
      var diff = limitDate.difference(date);
      if (diff.isNegative) {
        return true;
      }
    }
    return false;
  }

  DateTime _getTransferStartingDate() {
    var year = 0;
    var today = DateTime.now();
    if (today.month >= SUMMER_TRANSFER_WINDOW.month) {
      year = today.year;
    } else {
      year = today.year - 1;
    }
    return SUMMER_TRANSFER_WINDOW.copyWith(year: year);
  }
}
