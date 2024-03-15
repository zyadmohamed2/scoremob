import 'package:scoremob/data/model/fixtures_response/fixture_data.dart';

import '../base_response.dart';

class FixturesResponse extends BaseResponse {
  FixturesResponse({
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
  late final List<FixtureDataDTO?> data;

  FixturesResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = List.from(json['response'])
        .map((e) => FixtureDataDTO.fromJson(e))
        .toList();
  }

  @override
  Map<String, dynamic> toJson() {
    final _data = super.toJson();
    _data['response'] = data.map((e) => e?.toJson()).toList();
    return _data;
  }
}
