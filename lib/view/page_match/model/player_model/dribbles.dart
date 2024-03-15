class Dribbles {
  dynamic attempts;
  dynamic success;
  dynamic past;

  Dribbles({this.attempts, this.success, this.past});

  factory Dribbles.fromJson(Map<String, dynamic> json) => Dribbles(
        attempts: json['attempts'] as dynamic,
        success: json['success'] as dynamic,
        past: json['past'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'attempts': attempts,
        'success': success,
        'past': past,
      };
}
