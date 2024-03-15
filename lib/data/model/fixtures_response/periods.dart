class PeriodsDTO {
  PeriodsDTO({
    this.first,
    this.second,
  });
  int? first; // first period timestamp
  int? second; // second period timestamp

  PeriodsDTO.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    second = json['second'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first'] = first;
    _data['second'] = second;
    return _data;
  }
}
