import 'package:scoremob/data/model/league_response/league_data.dart';

import '../base_response.dart';

class LeaguesResponse extends BaseResponse {
  LeaguesResponse({
    required String get,
    required Map<String, dynamic> parameters,
    required Map<String, dynamic> errors,
    required int results,
    required Paging paging,
    required this.data,
  }) : super(
            get: get,
            parameters: parameters,
            errors: errors,
            results: results,
            paging: paging);
  List<LeagueDataDTO?> data;

  LeaguesResponse.fromJson(Map<String, dynamic> json)
      : data = List.from(json['response'])
            .map((e) => LeagueDataDTO.fromJson(e))
            .toList(),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final _data = super.toJson();
    _data['response'] = data.map((e) => e?.toJson()).toList();
    return _data;
  }
}
