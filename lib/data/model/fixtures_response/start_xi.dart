import 'package:scoremob/data/model/fixtures_response/start_xi_player.dart';

class StartXIDTO {
  StartXIDTO({
    required this.player,
  });
  StartXIPlayerDTO? player;

  StartXIDTO.fromJson(Map<String, dynamic> json) {
    player = StartXIPlayerDTO.fromJson(json['player']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['player'] = player?.toJson();
    return _data;
  }
}
