import 'package:scoremob/data/model/fixtures_response/player_info.dart';
import 'package:scoremob/data/model/fixtures_response/player_stats.dart';

class FixturePlayerDTO {
  FixturePlayerInfoDTO? player;
  List<FixturePlayerStatsDTO?>? statistics;

  FixturePlayerDTO({this.player, this.statistics});

  FixturePlayerDTO.fromJson(Map<String, dynamic> json) {
    player = FixturePlayerInfoDTO.fromJson(json['player']);
    statistics = List.from(json['statistics'])
        .map((e) => FixturePlayerStatsDTO.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['player'] = player?.toJson();
    _data['statistics'] = statistics?.map((e) => e?.toJson()).toList();
    return _data;
  }
}
