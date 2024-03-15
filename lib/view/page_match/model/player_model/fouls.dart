class Fouls {
  int? drawn;
  int? committed;

  Fouls({this.drawn, this.committed});

  factory Fouls.fromJson(Map<String, dynamic> json) => Fouls(
        drawn: json['drawn'] as int?,
        committed: json['committed'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'drawn': drawn,
        'committed': committed,
      };
}
