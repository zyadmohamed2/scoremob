import 'package:scoremob/data/model/shared/team.dart';

class TeamsDTO {
  TeamsDTO({
    required this.home,
    required this.away,
  });
  TeamDTO? home;
  TeamDTO? away;

  TeamsDTO.fromJson(Map<String, dynamic> json) {
    home = TeamDTO.fromJson(json['home']);
    away = TeamDTO.fromJson(json['away']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['home'] = home?.toJson();
    _data['away'] = away?.toJson();
    return _data;
  }
}
