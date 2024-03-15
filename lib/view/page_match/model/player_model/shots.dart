class Shots {
  dynamic total;
  dynamic on;

  Shots({this.total, this.on});

  factory Shots.fromJson(Map<String, dynamic> json) => Shots(
        total: json['total'] as dynamic,
        on: json['on'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'on': on,
      };
}
