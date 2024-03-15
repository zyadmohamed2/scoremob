import 'dart:convert';

class PlayerDribblesDTO {
  final int? attempts;
  final int? success;
  final int? past;

  PlayerDribblesDTO({
    this.attempts,
    this.success,
    this.past,
  });

  factory PlayerDribblesDTO.fromRawJson(String str) =>
      PlayerDribblesDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerDribblesDTO.fromJson(Map<String, dynamic> json) =>
      PlayerDribblesDTO(
        attempts: json["attempts"],
        success: json["success"],
        past: json["past"],
      );

  Map<String, dynamic> toJson() => {
        "attempts": attempts,
        "success": success,
        "past": past,
      };
}
