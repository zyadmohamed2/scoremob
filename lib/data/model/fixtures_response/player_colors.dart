class PlayerColorsDTO {
  PlayerColorsDTO({
    required this.primary,
    required this.number,
    required this.border,
  });
  String? primary;
  String? number;
  String? border;

  PlayerColorsDTO.fromJson(Map<String, dynamic> json) {
    primary = json['primary'];
    number = json['number'];
    border = json['border'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['primary'] = primary;
    _data['number'] = number;
    _data['border'] = border;
    return _data;
  }
}
