import 'package:scoremob/data/model/league_response/league_data.dart';
import 'package:scoremob/data/model/standings_response/standings_data.dart';
import 'package:scoremob/repo/leagues_repo/leagues_repo.dart';

class LeaguesRepoImpl extends LeaguesRepo {
  @override
  Future<Map<int, LeagueDataDTO>> fetchSupportedLeagues(
      List<int> supportedLeagues) async {
    var result = <int, LeagueDataDTO>{};
    for (var element in supportedLeagues) {
      var temp = await apiClient.getLeagueInfo(element);

      if (temp?.data.isEmpty == true) {
        throw "Can t Get Supported Leagues Info : ${temp?.errors}";
      }
      var league = temp?.data.firstOrNull;
      if (league != null) {
        result[league.league?.id ?? 0] = league;
      }
    }
    return result;
  }

  @override
  Future<StandingsDataDTO?> fetchLeagueStandings(
      int leagueId, int season) async {
    var response = await apiClient.getLeagueStandings(leagueId, season);
    checkError(response,
        "Error getting league standings  : ${response?.errors?.toString()}");
    return response?.data.firstOrNull;
  }

  @override
  Future<LeagueDataDTO?> fetchLeaguesById(int leagueId) async {
    var response = await apiClient.getLeagueInfo(leagueId);
    checkError(response,
        "Error getting league by id  : ${response?.errors?.toString()}");
    return response?.data.firstOrNull;
  }
}
