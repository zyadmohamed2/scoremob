import 'package:scoremob/data/model/fixtures_response/statistics_item.dart';
import 'package:scoremob/data/model/shared/team.dart';

class StatisticsDTO {
  StatisticsDTO({
    required this.team,
    required this.statistics,
  });
  TeamDTO? team;
  List<StatisticsItemDTO?>? statistics;

  StatisticsDTO.fromJson(Map<String, dynamic> json) {
    team = TeamDTO.fromJson(json['team']);
    statistics = List.from(json['statistics'])
        .map((e) => StatisticsItemDTO.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['team'] = team?.toJson();
    _data['statistics'] = statistics?.map((e) => e?.toJson()).toList();
    return _data;
  }
}
