import 'package:scoremob/data/model/standings_response/standings_data.dart';

import '../base_response.dart';

class StandingsResponse extends BaseResponse {
  StandingsResponse({
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
  late final List<StandingsDataDTO> data;

  StandingsResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = List.from(json['response'])
        .map((e) => StandingsDataDTO.fromJson(e))
        .toList();
  }

  @override
  Map<String, dynamic> toJson() {
    final _data = super.toJson();
    _data['response'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}
