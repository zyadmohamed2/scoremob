import 'dart:convert';

import 'package:scoremob/data/model/base_response.dart';
import 'package:scoremob/data/model/players_response/player_data.dart';

class PlayersResponse extends BaseResponse {
  PlayersResponse({
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
  late final List<PlayerDataDTO> data;

  PlayersResponse.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    data = List.from(json['response'])
        .map((e) => PlayerDataDTO.fromJson(e))
        .toList();
  }

  @override
  Map<String, dynamic> toJson() {
    final _data = super.toJson();
    _data['response'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}
