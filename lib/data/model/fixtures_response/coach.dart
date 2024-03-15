class CoachDTO {
  CoachDTO({
    required this.id,
    required this.name,
    required this.photo,
  });
  int? id;
  String? name;
  String? photo;

  CoachDTO.fromJson(Map<String, dynamic> json) {
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
