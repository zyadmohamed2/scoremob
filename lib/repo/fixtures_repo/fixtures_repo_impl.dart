import 'package:scoremob/data/model/fixtures_response/fixture_data.dart';
import 'package:scoremob/data/model/league_response/league_data.dart';
import 'package:scoremob/utils/date_utils.dart';

import 'fixtures_repo.dart';

class FixturesRepoImpl extends FixturesRepo {
  @override
  Future<Map<int, List<FixtureDataDTO>>> fetchByFixturesDate(DateTime dateFrom,
      DateTime dateTo, String timezone, Map<int, LeagueDataDTO> leagues) async {
    var fixtures = <int, List<FixtureDataDTO>>{};
    for (var element in leagues.values) {
      var temp = await apiClient.getFixtures(
          element.league?.id ?? 0,
          element.seasons?.firstOrNull?.year ?? 0,
          dateFrom.formatYYY_MM_DD(),
          dateTo.formatYYY_MM_DD(),
          timezone);
      checkError(temp,
          "Error getting fixture for league ${element.league?.name} : ${temp?.errors?.toString()}");
      var filtered = (temp?.data ?? []).whereType<FixtureDataDTO>().toList();
      fixtures[element.league?.id ?? 0] = filtered;
    }

    return fixtures;
  }

  @override
  Future<FixtureDataDTO?> fetchFixtureById(int id, String timezone) async {
    var response = await apiClient.getFixtureById(id, timezone);
    checkError(response,
        "Error getting fixture details : ${response?.errors?.toString()}");
    return response?.data.firstOrNull;
  }

  @override
  Future<List<FixtureDataDTO>?> fetchH2H(
      int homeTeamId, int awayTeamId, String timezone, int count) async {
    var response =
        await apiClient.getH2H(homeTeamId, awayTeamId, count, timezone);
    checkError(response,
        "Error getting fixture H2H : ${response?.errors?.toString()}");
    return response?.data;
  }

  @override
  Future<List<FixtureDataDTO>?> fetchLastFixturesByTeam(
      int teamId, int gamesNumber, String timezone) async {
    var response =
        await apiClient.getLastFixtures(teamId, timezone, gamesNumber);
    checkError(response,
        "Error getting fixtures by teams : ${response?.errors?.toString()}");
    var filtered = (response?.data ?? []).whereType<FixtureDataDTO>().toList();
    return filtered;
  }

  @override
  Future<List<FixtureDataDTO>?> fetchNextFixturesByTeam(
      int teamId, int gamesNumber, String timezone) async {
    var response =
        await apiClient.getNextFixtures(teamId, timezone, gamesNumber);
    checkError(response,
        "Error getting fixtures by team : ${response?.errors?.toString()}");
    var filtered = (response?.data ?? []).whereType<FixtureDataDTO>().toList();
    return filtered;
  }

  @override
  Future<List<FixtureDataDTO>?> fetchFixturesByLeague(
      int leagueId, int season, String timezone) async {
    var response =
        await apiClient.getFixturesByLeague(leagueId, season, timezone);
    checkError(response,
        "Error getting fixtures by league : ${response?.errors?.toString()}");
    var filtered = (response?.data ?? []).whereType<FixtureDataDTO>().toList();
    return filtered;
  }

  @override
  Future<List<FixtureDataDTO>?> fetchFixturesByRound(
      int leagueId, int season, String timezone, String round) async {
    var response =
        await apiClient.getFixturesByRound(leagueId, season, round, timezone);
    checkError(response,
        "Error getting fixtures by round : ${response?.errors?.toString()}");
    var filtered = (response?.data ?? []).whereType<FixtureDataDTO>().toList();
    return filtered;
  }
}
