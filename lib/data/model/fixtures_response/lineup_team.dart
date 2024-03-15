import 'package:scoremob/data/model/fixtures_response/lineup_colors.dart';

class LineupTeamDTO {
  LineupTeamDTO({
    required this.id,
    required this.name,
    required this.logo,
    required this.colors,
  });
  int? id;
  String? name;
  String? logo;
  LineupColorsDTO? colors;

  LineupTeamDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    colors = LineupColorsDTO.fromJson(json['colors']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['logo'] = logo;
    _data['colors'] = colors?.toJson();
    return _data;
  }
}
