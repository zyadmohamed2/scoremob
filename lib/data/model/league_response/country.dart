class CountryDTO {
  CountryDTO({
    required this.name,
    this.code,
    this.flag,
  });
  String? name;
  String? code;
  String? flag;

  CountryDTO.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    ;
    flag = json['flag'];
    ;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['code'] = code;
    _data['flag'] = flag;
    return _data;
  }
}
