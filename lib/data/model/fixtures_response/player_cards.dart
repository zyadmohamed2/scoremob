class FixturePlayerCardsDTO {
  int? yellow;
  int? red;

  FixturePlayerCardsDTO({this.yellow, this.red});

  FixturePlayerCardsDTO.fromJson(Map<String, dynamic> json) {
    yellow = json['yellow'];
    red = json['red'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['yellow'] = yellow;
    _data['red'] = red;
    return _data;
  }
}
