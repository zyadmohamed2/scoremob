class FixtureTeamDTO {
  int? id;
  String? name;
  String? logo;
  String? update; //date

  FixtureTeamDTO({this.id, this.name, this.logo, this.update});

  FixtureTeamDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    update = json['update'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['logo'] = logo;
    _data['update'] = update;
    return _data;
  }
}
