import 'package:scoremob/data/model/league_response/league_data.dart';
import 'package:scoremob/data/model/standings_response/standings_data.dart';

import '../base_repo.dart';

abstract class LeaguesRepo extends BaseRepo {
  Future<Map<int, LeagueDataDTO>> fetchSupportedLeagues(
      List<int> supportedLeagues);

  Future<LeagueDataDTO?> fetchLeaguesById(int leagueId);

  Future<StandingsDataDTO?> fetchLeagueStandings(int leagueId, int season);
}
