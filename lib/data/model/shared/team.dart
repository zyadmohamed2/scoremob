class TeamDTO {
  TeamDTO({
    required this.id,
    required this.name,
    required this.logo,
    this.winner,
  });
  int? id;
  String? name;
  String? logo;
  bool? winner;

  TeamDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    winner = json['winner'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['logo'] = logo;
    _data['winner'] = winner;
    return _data;
  }
}
