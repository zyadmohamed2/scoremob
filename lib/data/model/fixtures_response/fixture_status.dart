class StatusDTO {
  StatusDTO({
    required this.long,
    required this.short,
    this.elapsed,
  });
  String? long; //"Match Finished"
  String? short; //"FT"
  int? elapsed; //90 minutes

  StatusDTO.fromJson(Map<String, dynamic> json) {
    long = json['long'];
    short = json['short'];
    elapsed = json['elapsed'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['long'] = long;
    _data['short'] = short;
    _data['elapsed'] = elapsed;
    return _data;
  }
}
