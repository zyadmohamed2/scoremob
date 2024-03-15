class Substitutes {
  int? substitutesIn;
  int? out;
  int? bench;

  Substitutes({this.substitutesIn, this.out, this.bench});

  factory Substitutes.fromJson(Map<String, dynamic> json) => Substitutes(
        substitutesIn: json['in'] as int?,
        out: json['out'] as int?,
        bench: json['bench'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'in': substitutesIn,
        'out': out,
        'bench': bench,
      };
}
