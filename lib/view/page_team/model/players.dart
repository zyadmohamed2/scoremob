import 'dart:collection';

import 'package:scoremob/data/model/players_response/player_data.dart';
import 'package:scoremob/view/page_team/model/player_data.dart';

class Players {
  final HashMap<String, List<PlayerData>> positions =
      HashMap<String, List<PlayerData>>();

  Players();

  Players.empty();

  Players.fromDTO(List<PlayerDataDTO?>? list) {
    list?.forEach((element) {
      var player = PlayerData.fromDTO(element);
      var key = player.getPosition();

      var oldList = (positions[key] ?? []);
      oldList.add(player);
      positions[key] = oldList;
    });
  }
}
