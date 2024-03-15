import 'coverage.dart';

class SeasonDTO {
  SeasonDTO({
    required this.year,
    required this.start,
    required this.end,
    required this.current,
    required this.coverage,
  });
  int? year;
  String? start;
  String? end;
  bool? current;
  CoverageDTO? coverage;

  SeasonDTO.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    start = json['start'];
    end = json['end'];
    current = json['current'];
    coverage = CoverageDTO.fromJson(json['coverage']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['year'] = year;
    _data['start'] = start;
    _data['end'] = end;
    _data['current'] = current;
    _data['coverage'] = coverage?.toJson();
    return _data;
  }
}
