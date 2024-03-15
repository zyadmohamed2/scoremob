import 'dart:convert';

import 'package:scoremob/data/model/players_response/player.dart';
import 'package:scoremob/data/model/players_response/stastic.dart';

class PlayerDataDTO {
  final PlayerDTO? player;
  final List<StatisticDTO>? statistics;

  PlayerDataDTO({
    this.player,
    this.statistics,
  });

  factory PlayerDataDTO.fromRawJson(String str) =>
      PlayerDataDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerDataDTO.fromJson(Map<String, dynamic> json) => PlayerDataDTO(
        player:
            json["player"] == null ? null : PlayerDTO.fromJson(json["player"]),
        statistics: json["statistics"] == null
            ? []
            : List<StatisticDTO>.from(
                json["statistics"]!.map((x) => StatisticDTO.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "player": player?.toJson(),
        "statistics": statistics == null
            ? []
            : List<dynamic>.from(statistics!.map((x) => x.toJson())),
      };
}
