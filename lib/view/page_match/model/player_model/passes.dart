class Passes {
  int? total;
  dynamic key;
  int? accuracy;

  Passes({this.total, this.key, this.accuracy});

  factory Passes.fromJson(Map<String, dynamic> json) => Passes(
        total: json['total'] as int?,
        key: json['key'] as dynamic,
        accuracy: json['accuracy'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'key': key,
        'accuracy': accuracy,
      };
}
