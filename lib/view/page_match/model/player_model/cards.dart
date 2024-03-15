class Cards {
  int? yellow;
  int? yellowred;
  int? red;

  Cards({this.yellow, this.yellowred, this.red});

  factory Cards.fromJson(Map<String, dynamic> json) => Cards(
        yellow: json['yellow'] as int?,
        yellowred: json['yellowred'] as int?,
        red: json['red'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'yellow': yellow,
        'yellowred': yellowred,
        'red': red,
      };
}
