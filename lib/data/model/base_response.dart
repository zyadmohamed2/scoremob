class BaseResponse {
  BaseResponse({
    required this.get,
    required this.parameters,
    required this.errors,
    required this.results,
    required this.paging,
  });

  late final String get;
  late final dynamic parameters;
  late final dynamic errors;
  late final int results;
  late final Paging paging;

  BaseResponse.fromJson(Map<String, dynamic> json) {
    get = json['get'];
    parameters = json['parameters'];
    errors = json['errors'];
    results = json['results'];
    paging = Paging.fromJson(json['paging']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['get'] = get;
    _data['parameters'] = parameters;
    _data['errors'] = errors;
    _data['results'] = results;
    _data['paging'] = paging.toJson();
    return _data;
  }
}

class Paging {
  Paging({
    required this.current,
    required this.total,
  });

  late final int current;
  late final int total;

  Paging.fromJson(Map<String, dynamic> json) {
    current = json['current'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current'] = current;
    _data['total'] = total;
    return _data;
  }
}
