class EventTimeDTO {
  EventTimeDTO({
    required this.elapsed,
    this.extra,
  });

  int? elapsed;
  int? extra;

  EventTimeDTO.fromJson(Map<String, dynamic> json) {
    elapsed = json['elapsed'];
    extra = json['extra'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['elapsed'] = elapsed;
    _data['extra'] = extra;
    return _data;
  }
}
