import 'package:scoremob/data/model/fixtures_response/player_colors.dart';

class LineupColorsDTO {
  LineupColorsDTO({
    required this.player,
    required this.goalkeeper,
  });
  PlayerColorsDTO? player;
  PlayerColorsDTO? goalkeeper;

  LineupColorsDTO.fromJson(Map<String, dynamic> json) {
    player = PlayerColorsDTO?.fromJson(json['player']);
    goalkeeper = PlayerColorsDTO?.fromJson(json['goalkeeper']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['player'] = player?.toJson();
    _data['goalkeeper'] = goalkeeper?.toJson();
    return _data;
  }
}
