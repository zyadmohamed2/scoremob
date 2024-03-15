class EventPlayerDTO {
  EventPlayerDTO({
    required this.id,
    required this.name,
  });

  int? id;
  String? name;

  EventPlayerDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}
