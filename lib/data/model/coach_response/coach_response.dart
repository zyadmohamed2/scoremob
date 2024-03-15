import '../base_response.dart';
import 'coach_info.dart';

class CoachResponse extends BaseResponse {
  CoachResponse({
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
  List<CoachInfoDTO?> data;

  CoachResponse.fromJson(Map<String, dynamic> json)
      : data = List.from(json['response'])
            .map((e) => CoachInfoDTO.fromJson(e))
            .toList(),
        super.fromJson(json);

  @override
  Map<String, dynamic> toJson() {
    final _data = super.toJson();
    _data['response'] = data.map((e) => e?.toJson()).toList();
    return _data;
  }
}
