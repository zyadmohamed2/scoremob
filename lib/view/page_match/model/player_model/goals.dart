class Goals {
  int? total;
  int? conceded;
  dynamic assists;
  dynamic saves;

  Goals({this.total, this.conceded, this.assists, this.saves});

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        total: json['total'] as int?,
        conceded: json['conceded'] as int?,
        assists: json['assists'] as dynamic,
        saves: json['saves'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'conceded': conceded,
        'assists': assists,
        'saves': saves,
      };
}
