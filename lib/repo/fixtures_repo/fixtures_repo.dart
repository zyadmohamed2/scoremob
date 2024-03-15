import 'package:scoremob/data/model/fixtures_response/fixture_data.dart';
import 'package:scoremob/data/model/league_response/league_data.dart';
import 'package:scoremob/repo/base_repo.dart';

abstract class FixturesRepo extends BaseRepo {
  Future<Map<int, List<FixtureDataDTO>>> fetchByFixturesDate(DateTime dateFrom,
      DateTime dateTo, String timezone, Map<int, LeagueDataDTO> leagues);

  Future<FixtureDataDTO?> fetchFixtureById(int id, String timezone);

  Future<List<FixtureDataDTO>?> fetchH2H(
      int homeTeamId, int awayTeamId, String timezone, int count);

  Future<List<FixtureDataDTO>?> fetchLastFixturesByTeam(
      int teamId, int gamesNumber, String timezone);

  Future<List<FixtureDataDTO>?> fetchNextFixturesByTeam(
      int teamId, int gamesNumber, String timezone);

  Future<List<FixtureDataDTO>?> fetchFixturesByLeague(
      int leagueId, int season, String timezone);

  Future<List<FixtureDataDTO>?> fetchFixturesByRound(
      int leagueId, int season, String timezone, String round);
}
