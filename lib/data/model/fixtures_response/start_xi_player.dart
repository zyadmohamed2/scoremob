class StartXIPlayerDTO {
  StartXIPlayerDTO({
    required this.id,
    required this.name,
    required this.number,
    required this.pos,
    required this.grid,
  });

  int? id;
  String? name;
  int? number;
  String? pos;
  String? grid;

  StartXIPlayerDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    pos = json['pos'];
    grid = json['grid'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['number'] = number;
    _data['pos'] = pos;
    _data['grid'] = grid;
    return _data;
  }
}
