class Games {
  int? appearences;
  int? lineups;
  int? minutes;
  dynamic number;
  String? position;
  String? rating;
  bool? captain;

  Games({
    this.appearences,
    this.lineups,
    this.minutes,
    this.number,
    this.position,
    this.rating,
    this.captain,
  });

  factory Games.fromJson(Map<String, dynamic> json) => Games(
        appearences: json['appearences'] as int?,
        lineups: json['lineups'] as int?,
        minutes: json['minutes'] as int?,
        number: json['number'] as dynamic,
        position: json['position'] as String?,
        rating: json['rating'].toString(),
        captain: json['captain'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'appearences': appearences,
        'lineups': lineups,
        'minutes': minutes,
        'number': number,
        'position': position,
        'rating': rating,
        'captain': captain,
      };
}
