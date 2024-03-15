class Duels {
  int? total;
  int? won;

  Duels({this.total, this.won});

  factory Duels.fromJson(Map<String, dynamic> json) => Duels(
        total: json['total'] as int?,
        won: json['won'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'won': won,
      };
}
