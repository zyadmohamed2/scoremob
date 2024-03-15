import 'cards.dart';
import 'dribbles.dart';
import 'duels.dart';
import 'fouls.dart';
import 'games.dart';
import 'goals.dart';
import 'league.dart';
import 'passes.dart';
import 'penalty.dart';
import 'shots.dart';
import 'substitutes.dart';
import 'tackles.dart';
import 'team.dart';

class Statistic {
  Team? team;
  League? league;
  Games? games;
  Substitutes? substitutes;
  Shots? shots;
  Goals? goals;
  Passes? passes;
  Tackles? tackles;
  Duels? duels;
  Dribbles? dribbles;
  Fouls? fouls;
  Cards? cards;
  Penalty? penalty;

  Statistic({
    this.team,
    this.league,
    this.games,
    this.substitutes,
    this.shots,
    this.goals,
    this.passes,
    this.tackles,
    this.duels,
    this.dribbles,
    this.fouls,
    this.cards,
    this.penalty,
  });

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        team: json['team'] == null
            ? null
            : Team.fromJson(json['team'] as Map<String, dynamic>),
        league: json['league'] == null
            ? null
            : League.fromJson(json['league'] as Map<String, dynamic>),
        games: json['games'] == null
            ? null
            : Games.fromJson(json['games'] as Map<String, dynamic>),
        substitutes: json['substitutes'] == null
            ? null
            : Substitutes.fromJson(json['substitutes'] as Map<String, dynamic>),
        shots: json['shots'] == null
            ? null
            : Shots.fromJson(json['shots'] as Map<String, dynamic>),
        goals: json['goals'] == null
            ? null
            : Goals.fromJson(json['goals'] as Map<String, dynamic>),
        passes: json['passes'] == null
            ? null
            : Passes.fromJson(json['passes'] as Map<String, dynamic>),
        tackles: json['tackles'] == null
            ? null
            : Tackles.fromJson(json['tackles'] as Map<String, dynamic>),
        duels: json['duels'] == null
            ? null
            : Duels.fromJson(json['duels'] as Map<String, dynamic>),
        dribbles: json['dribbles'] == null
            ? null
            : Dribbles.fromJson(json['dribbles'] as Map<String, dynamic>),
        fouls: json['fouls'] == null
            ? null
            : Fouls.fromJson(json['fouls'] as Map<String, dynamic>),
        cards: json['cards'] == null
            ? null
            : Cards.fromJson(json['cards'] as Map<String, dynamic>),
        penalty: json['penalty'] == null
            ? null
            : Penalty.fromJson(json['penalty'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'team': team?.toJson(),
        'league': league?.toJson(),
        'games': games?.toJson(),
        'substitutes': substitutes?.toJson(),
        'shots': shots?.toJson(),
        'goals': goals?.toJson(),
        'passes': passes?.toJson(),
        'tackles': tackles?.toJson(),
        'duels': duels?.toJson(),
        'dribbles': dribbles?.toJson(),
        'fouls': fouls?.toJson(),
        'cards': cards?.toJson(),
        'penalty': penalty?.toJson(),
      };
}
