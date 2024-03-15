import 'player.dart';
import 'statistic.dart';

class Response {
  Player? player;
  List<Statistic>? statistics;

  Response({this.player, this.statistics});

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        player: json['player'] == null
            ? null
            : Player.fromJson(json['player'] as Map<String, dynamic>),
        statistics: (json['statistics'] as List<dynamic>?)
            ?.map((e) => Statistic.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'player': player?.toJson(),
        'statistics': statistics?.map((e) => e.toJson()).toList(),
      };
}
