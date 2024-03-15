class FixturePlayerShotsDTO {
  int? total;
  int? on;

  FixturePlayerShotsDTO({this.total, this.on});

  FixturePlayerShotsDTO.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    on = json['on'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['on'] = on;
    return _data;
  }
}
