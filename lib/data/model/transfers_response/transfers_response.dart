import 'package:scoremob/data/model/base_response.dart';
import 'package:scoremob/data/model/transfers_response/player_transfer_data.dart';

class TransfersResponse extends BaseResponse {
  TransfersResponse({
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
  late final List<PlayerTransferDataDTO> data;

  TransfersResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = List.from(json['response'])
        .map((e) => PlayerTransferDataDTO.fromJson(e))
        .toList();
  }

  @override
  Map<String, dynamic> toJson() {
    final _data = super.toJson();
    _data['response'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}
