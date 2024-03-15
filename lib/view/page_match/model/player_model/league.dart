class League {
  dynamic id;
  String? name;
  dynamic country;
  dynamic logo;
  dynamic flag;
  int? season;

  League({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json['id'] as dynamic,
        name: json['name'] as String?,
        country: json['country'] as dynamic,
        logo: json['logo'] as dynamic,
        flag: json['flag'] as dynamic,
        season: int.parse(json['season'].toString()),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'country': country,
        'logo': logo,
        'flag': flag,
        'season': season,
      };
}
