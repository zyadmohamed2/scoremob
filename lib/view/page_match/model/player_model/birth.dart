class Birth {
  String? date;
  String? place;
  String? country;

  Birth({this.date, this.place, this.country});

  factory Birth.fromJson(Map<String, dynamic> json) => Birth(
        date: json['date'] as String?,
        place: json['place'] as String?,
        country: json['country'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'place': place,
        'country': country,
      };
}
