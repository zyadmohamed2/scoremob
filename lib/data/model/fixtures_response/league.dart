class FixtureLeagueDTO {
  FixtureLeagueDTO({
    required this.id,
    required this.name,
    required this.country,
    required this.logo,
    required this.flag,
    required this.season,
    required this.round,
  });
  int? id;
  String? name;
  String? country;
  String? logo;
  String? flag;
  int? season;
  String? round;

  FixtureLeagueDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    flag = json['flag'];
    season = json['season'];
    round = json['round'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['country'] = country;
    _data['logo'] = logo;
    _data['flag'] = flag;
    _data['season'] = season;
    _data['round'] = round;
    return _data;
  }
}
