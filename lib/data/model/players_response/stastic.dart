import 'dart:convert';

import 'package:scoremob/data/model/players_response/cards.dart';
import 'package:scoremob/data/model/shared/dribbles.dart';
import 'package:scoremob/data/model/shared/duels.dart';
import 'package:scoremob/data/model/shared/fouls.dart';
import 'package:scoremob/data/model/players_response/games.dart';
import 'package:scoremob/data/model/shared/goals.dart';
import 'package:scoremob/data/model/players_response/league.dart';
import 'package:scoremob/data/model/shared/passes.dart';
import 'package:scoremob/data/model/shared/penalty.dart';
import 'package:scoremob/data/model/players_response/shots.dart';
import 'package:scoremob/data/model/players_response/substitues.dart';
import 'package:scoremob/data/model/shared/tackles.dart';
import 'package:scoremob/data/model/shared/team.dart';

class StatisticDTO {
  final TeamDTO? team;
  final PlayerStatsLeagueDTO? league;
  final PlayerGamesDTO? games;
  final PlayerStatsSubstitutesDTO? substitutes;
  final PlayerShotsDTO? shots;
  final PlayerGoalsDTO? goals;
  final PlayerPassesDTO? passes;
  final PlayerTacklesDTO? tackles;
  final PlayerDuelsDTO? duels;
  final PlayerDribblesDTO? dribbles;
  final PlayerFoulsDTO? fouls;
  final PlayerCardsDTO? cards;
  final PlayerPenaltyDTO? penalty;

  StatisticDTO({
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

  factory StatisticDTO.fromRawJson(String str) =>
      StatisticDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StatisticDTO.fromJson(Map<String, dynamic> json) => StatisticDTO(
        team: json["team"] == null ? null : TeamDTO.fromJson(json["team"]),
        league: json["league"] == null
            ? null
            : PlayerStatsLeagueDTO.fromJson(json["league"]),
        games: json["games"] == null
            ? null
            : PlayerGamesDTO.fromJson(json["games"]),
        substitutes: json["substitutes"] == null
            ? null
            : PlayerStatsSubstitutesDTO.fromJson(json["substitutes"]),
        shots: json["shots"] == null
            ? null
            : PlayerShotsDTO.fromJson(json["shots"]),
        goals: json["goals"] == null
            ? null
            : PlayerGoalsDTO.fromJson(json["goals"]),
        passes: json["passes"] == null
            ? null
            : PlayerPassesDTO.fromJson(json["passes"]),
        tackles: json["tackles"] == null
            ? null
            : PlayerTacklesDTO.fromJson(json["tackles"]),
        duels: json["duels"] == null
            ? null
            : PlayerDuelsDTO.fromJson(json["duels"]),
        dribbles: json["dribbles"] == null
            ? null
            : PlayerDribblesDTO.fromJson(json["dribbles"]),
        fouls: json["fouls"] == null
            ? null
            : PlayerFoulsDTO.fromJson(json["fouls"]),
        cards: json["cards"] == null
            ? null
            : PlayerCardsDTO.fromJson(json["cards"]),
        penalty: json["penalty"] == null
            ? null
            : PlayerPenaltyDTO.fromJson(json["penalty"]),
      );

  Map<String, dynamic> toJson() => {
        "team": team?.toJson(),
        "league": league?.toJson(),
        "games": games?.toJson(),
        "substitutes": substitutes?.toJson(),
        "shots": shots?.toJson(),
        "goals": goals?.toJson(),
        "passes": passes?.toJson(),
        "tackles": tackles?.toJson(),
        "duels": duels?.toJson(),
        "dribbles": dribbles?.toJson(),
        "fouls": fouls?.toJson(),
        "cards": cards?.toJson(),
        "penalty": penalty?.toJson(),
      };
}
