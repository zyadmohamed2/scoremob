import 'package:scoremob/data/model/fixtures_response/start_xi_player.dart';

class SubstitutesDTO {
  SubstitutesDTO({
    required this.player,
  });
  StartXIPlayerDTO? player;

  SubstitutesDTO.fromJson(Map<String, dynamic> json) {
    player = StartXIPlayerDTO.fromJson(json['player']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['player'] = player?.toJson();
    return _data;
  }
}
