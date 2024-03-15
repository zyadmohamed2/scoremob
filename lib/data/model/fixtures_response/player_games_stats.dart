class FixturePlayerGamesStatsDTO {
  int? minutes;
  int? number;
  String? position;
  String? rating;
  bool? captain;
  bool? substitute;

  FixturePlayerGamesStatsDTO(
      {this.minutes,
      this.number,
      this.position,
      this.rating,
      this.captain,
      this.substitute});

  FixturePlayerGamesStatsDTO.fromJson(Map<String, dynamic> json) {
    minutes = json['minutes'];
    number = json['number'];
    position = json['position'];
    rating = json['rating'];
    captain = json['captain'];
    substitute = json['substitute'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['minutes'] = minutes;
    _data['number'] = number;
    _data['position'] = position;
    _data['rating'] = rating;
    _data['captain'] = captain;
    _data['substitute'] = substitute;
    return _data;
  }
}
