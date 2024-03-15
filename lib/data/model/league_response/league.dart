class LeagueDTO {
  LeagueDTO({
    required this.id,
    required this.name,
    required this.type,
    required this.logo,
  });
  int? id;
  String? name;
  String? type; //"Cup"  "League",
  String? logo;

  LeagueDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['type'] = type;
    _data['logo'] = logo;
    return _data;
  }
}
