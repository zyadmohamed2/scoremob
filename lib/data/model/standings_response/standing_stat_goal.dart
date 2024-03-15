import 'dart:convert';

class StandingStatGoals {
  final int? goalsFor;
  final int? against;

  StandingStatGoals({
    this.goalsFor,
    this.against,
  });

  factory StandingStatGoals.fromRawJson(String str) =>
      StandingStatGoals.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StandingStatGoals.fromJson(Map<String, dynamic> json) =>
      StandingStatGoals(
        goalsFor: json["for"],
        against: json["against"],
      );

  Map<String, dynamic> toJson() => {
        "for": goalsFor,
        "against": against,
      };
}
