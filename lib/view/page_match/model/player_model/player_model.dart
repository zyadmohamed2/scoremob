import 'paging.dart';
import 'parameters.dart';
import 'response.dart';

class PlayerModel {
  String? playerModelGet;
  Parameters? parameters;
  List<dynamic>? errors;
  int? results;
  Paging? paging;
  List<Response>? response;

  PlayerModel({
    this.playerModelGet,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
    this.response,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        playerModelGet: json['get'] as String?,
        parameters: json['parameters'] == null
            ? null
            : Parameters.fromJson(json['parameters'] as Map<String, dynamic>),
        errors: json['errors'] as List<dynamic>?,
        results: json['results'] as int?,
        paging: json['paging'] == null
            ? null
            : Paging.fromJson(json['paging'] as Map<String, dynamic>),
        response: (json['response'] as List<dynamic>?)
            ?.map((e) => Response.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'get': playerModelGet,
        'parameters': parameters?.toJson(),
        'errors': errors,
        'results': results,
        'paging': paging?.toJson(),
        'response': response?.map((e) => e.toJson()).toList(),
      };
}
