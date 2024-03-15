class StatisticsItemDTO {
  String? type;
  dynamic value;

  StatisticsItemDTO.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['value'] = value;
    return _data;
  }
}
