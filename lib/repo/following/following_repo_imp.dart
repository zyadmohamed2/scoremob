import 'dart:developer';

import 'package:scoremob/data/api/api_client.dart';
import 'package:scoremob/repo/following/following_repo.dart';
import 'package:scoremob/view/page_match/model/player_model/player_model.dart';

class FollowingRepoImp extends FollowingRepo {
  ApiClient apiClient = ApiClient();

  @override
  Future<PlayerModel> getPlayerFollowing() async {
    try {
      var response = await apiClient.getPlayer(
          id: "1", season: DateTime.now().year.toString());
      PlayerModel? playerResponse = PlayerModel.fromJson(response);
      return playerResponse;
    } catch (e) {
      log(e.toString());
      throw e;
    }
  }

  @override
  Future<void> getTeamFollowing() async {
    try {
      var response = await apiClient.getTeamInfo(1);
      log(response.toString());
    } catch (e) {}
  }
}
