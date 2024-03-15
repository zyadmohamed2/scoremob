class FixturePlayerInfoDTO {
  int? id;
  String? name;
  String? photo;

  FixturePlayerInfoDTO({this.id, this.name, this.photo});

  FixturePlayerInfoDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['photo'] = photo;
    return _data;
  }
}
