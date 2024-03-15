class Parameters {
  String? id;
  String? season;

  Parameters({this.id, this.season});

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        id: json['id'] as String?,
        season: json['season'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'season': season,
      };
}