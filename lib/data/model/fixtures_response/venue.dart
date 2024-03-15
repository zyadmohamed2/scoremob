class VenueDTO {
  VenueDTO({
    required this.id,
    required this.name,
    required this.city,
  });
  int? id;
  String? name;
  String? city;

  VenueDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['city'] = city;
    return _data;
  }
}
