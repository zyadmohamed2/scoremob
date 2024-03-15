class Penalty {
  dynamic won;
  dynamic commited;
  int? scored;
  int? missed;
  dynamic saved;

  Penalty({this.won, this.commited, this.scored, this.missed, this.saved});

  factory Penalty.fromJson(Map<String, dynamic> json) => Penalty(
        won: json['won'] as dynamic,
        commited: json['commited'] as dynamic,
        scored: json['scored'] as int?,
        missed: json['missed'] as int?,
        saved: json['saved'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'won': won,
        'commited': commited,
        'scored': scored,
        'missed': missed,
        'saved': saved,
      };
}
