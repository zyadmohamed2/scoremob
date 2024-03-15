class PeriodScoreDTO {
  PeriodScoreDTO({
    this.home,
    this.away,
  });
  int? home;
  int? away;

  PeriodScoreDTO.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['home'] = home;
    _data['away'] = away;
    return _data;
  }
}
