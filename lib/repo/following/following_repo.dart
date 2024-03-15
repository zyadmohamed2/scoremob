import 'package:scoremob/view/page_match/model/player_model/player_model.dart';

abstract class FollowingRepo {
  Future<PlayerModel> getPlayerFollowing();
  Future<void> getTeamFollowing();
}
