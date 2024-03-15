import 'period_score.dart';

class ScoreDTO {
  ScoreDTO({
    required this.halftime,
    required this.fulltime,
    required this.extratime,
    required this.penalty,
  });
  PeriodScoreDTO? halftime;
  PeriodScoreDTO? fulltime;
  PeriodScoreDTO? extratime;
  PeriodScoreDTO? penalty;

  ScoreDTO.fromJson(Map<String, dynamic> json) {
    halftime = PeriodScoreDTO.fromJson(json['halftime']);
    fulltime = PeriodScoreDTO.fromJson(json['fulltime']);
    extratime = PeriodScoreDTO.fromJson(json['extratime']);
    penalty = PeriodScoreDTO.fromJson(json['penalty']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['halftime'] = halftime?.toJson();
    _data['fulltime'] = fulltime?.toJson();
    _data['extratime'] = extratime?.toJson();
    _data['penalty'] = penalty?.toJson();
    return _data;
  }
}
