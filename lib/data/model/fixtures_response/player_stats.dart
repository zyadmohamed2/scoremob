import 'package:scoremob/data/model/fixtures_response/player_cards.dart';
import 'package:scoremob/data/model/fixtures_response/player_games_stats.dart';
import 'package:scoremob/data/model/fixtures_response/player_shots.dart';
import 'package:scoremob/data/model/shared/dribbles.dart';
import 'package:scoremob/data/model/shared/duels.dart';
import 'package:scoremob/data/model/shared/fouls.dart';
import 'package:scoremob/data/model/shared/goals.dart';
import 'package:scoremob/data/model/shared/passes.dart';
import 'package:scoremob/data/model/shared/penalty.dart';
import 'package:scoremob/data/model/shared/tackles.dart';

class FixturePlayerStatsDTO {
  FixturePlayerGamesStatsDTO? games;
  int? offsides;
  FixturePlayerShotsDTO? shots;
  PlayerGoalsDTO? goals;
  PlayerPassesDTO? passes;
  PlayerTacklesDTO? tackles;
  PlayerDuelsDTO? duels;
  PlayerDribblesDTO? dribbles;
  PlayerFoulsDTO? fouls;
  FixturePlayerCardsDTO? cards;
  PlayerPenaltyDTO? penalty;

  FixturePlayerStatsDTO(
      {this.games,
      this.offsides,
      this.shots,
      this.goals,
      this.passes,
      this.tackles,
      this.duels,
      this.dribbles,
      this.fouls,
      this.cards,
      this.penalty});

  FixturePlayerStatsDTO.fromJson(Map<String, dynamic> json) {
    games = FixturePlayerGamesStatsDTO.fromJson(json['games']);
    shots = FixturePlayerShotsDTO.fromJson(json['shots']);
    goals = PlayerGoalsDTO.fromJson(json['goals']);
    passes = PlayerPassesDTO.fromJson(json['passes']);
    tackles = PlayerTacklesDTO.fromJson(json['tackles']);
    duels = PlayerDuelsDTO.fromJson(json['duels']);
    dribbles = PlayerDribblesDTO.fromJson(json['dribbles']);
    fouls = PlayerFoulsDTO.fromJson(json['fouls']);
    cards = FixturePlayerCardsDTO.fromJson(json['cards']);
    penalty = PlayerPenaltyDTO.fromJson(json['penalty']);
    offsides = json['offsides'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['offsides'] = offsides;
    _data['games'] = games?.toJson();
    _data['shots'] = shots?.toJson();
    _data['goals'] = goals?.toJson();
    _data['passes'] = passes?.toJson();
    _data['tackles'] = tackles?.toJson();
    _data['duels'] = duels?.toJson();
    _data['dribbles'] = dribbles?.toJson();
    _data['fouls'] = fouls?.toJson();
    _data['cards'] = cards?.toJson();
    _data['penalty'] = penalty?.toJson();
    return _data;
  }
}
