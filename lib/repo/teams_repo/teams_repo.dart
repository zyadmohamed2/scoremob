import 'package:scoremob/data/model/players_response/player_data.dart';
import 'package:scoremob/data/model/team_response/team_data.dart';
import 'package:scoremob/data/model/transfers_response/player_transfer_data.dart';
import 'package:scoremob/repo/base_repo.dart';

import '../../data/model/coach_response/coach_info.dart';
import '../../data/model/coach_response/coach_response.dart';

abstract class TeamsRepo extends BaseRepo {
  Future<List<PlayerDataDTO?>?> fetchTeamPlayers(int season, int teamId);

  Future<TeamDataDTO?> fetchTeamInfo(int teamId);

  Future<List<CoachInfoDTO?>?> fetchTeamCoaches(int teamId);

  Future<List<PlayerTransferDataDTO?>?> fetchTeamTransfersInfo(int teamId);
}
