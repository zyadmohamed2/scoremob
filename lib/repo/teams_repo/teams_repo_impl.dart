import 'package:scoremob/data/model/coach_response/coach_info.dart';
import 'package:scoremob/data/model/coach_response/coach_response.dart';
import 'package:scoremob/data/model/players_response/player_data.dart';
import 'package:scoremob/data/model/team_response/team_data.dart';
import 'package:scoremob/data/model/transfers_response/player_transfer_data.dart';
import 'package:scoremob/repo/teams_repo/teams_repo.dart';

class TeamsRepoImpl extends TeamsRepo {
  @override
  Future<List<PlayerDataDTO?>?> fetchTeamPlayers(int season, int teamId) async {
    var response = await apiClient.getTeamPlayers(season, teamId);
    checkError(
        response, "Error getting team players ,season :$season  team:$teamId");
    return response?.data;
  }

  @override
  Future<TeamDataDTO?> fetchTeamInfo(int teamId) async {
    var response = await apiClient.getTeamInfo(teamId);
    checkError(response, "Error getting team info , team:$teamId");
    return response?.data.firstOrNull;
  }

  @override
  Future<List<PlayerTransferDataDTO?>?> fetchTeamTransfersInfo(
      int teamId) async {
    var response = await apiClient.getTeamTransfers(teamId);
    checkError(response, "Error getting team transfers , team:$teamId");
    return response?.data;
  }

  @override
  Future<List<CoachInfoDTO?>?> fetchTeamCoaches(int teamId) async {
    var response = await apiClient.getTeamCoaches(teamId);
    checkError(response, "Error getting team coach , team:$teamId");
    return response?.data;
  }
}
