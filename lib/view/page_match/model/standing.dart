import 'package:flutter/material.dart';
import 'package:scoremob/data/model/standings_response/standing.dart';
import 'package:scoremob/view/page_match/model/standings_tier.dart';
import 'package:scoremob/view/shared/model/team.dart';

import 'game_stats.dart';

class Standing {
  int rank;
  int points;
  int _goalsDiff;
  int gamesPlayed;
  Team team;
  String description;
  GamesStats allGamesStats;

  Standing.empty()
      : this.rank = 0,
        this._goalsDiff = 0,
        this.points = 0,
        this.gamesPlayed = 0,
        this.description = '',
        this.allGamesStats = GamesStats.empty(),
        this.team = Team.empty();

  Standing.fromDTO(StandingDTO? dto)
      : this.rank = dto?.rank ?? 0,
        this._goalsDiff = dto?.goalsDiff ?? 0,
        this.description = dto?.description ?? '',
        this.points = dto?.points ?? 0,
        this.allGamesStats = GamesStats.fromDTO(dto?.all),
        this.gamesPlayed = dto?.all?.played ?? 0,
        this.team = Team.fromDTO(dto?.team);

  // StandingOutcomeEnum getRankOutcome() {
  //   if (this.description.toLowerCase().contains('champions')) {
  //     return StandingOutcomeEnum.UCL;
  //   }
  //   if (this.description.toLowerCase().contains('relegation')) {
  //     return StandingOutcomeEnum.Relegation;
  //   }
  //   if (this.description.toLowerCase().contains('europa league')) {
  //     return StandingOutcomeEnum.EuropaLeague;
  //   }
  //   if (this.description.toLowerCase().contains('europa conference')) {
  //     return StandingOutcomeEnum.EuropaConference;
  //   }
  //
  //   return StandingOutcomeEnum.Normal;
  // }

  String getGoalsDiff() {
    if (_goalsDiff > 0) {
      return '+$_goalsDiff';
    }
    return _goalsDiff.toString();
  }

  double getGoalsPerMatch() {
    double roundedDouble = double.parse((this.allGamesStats.goalsFor /
            ((this.allGamesStats.played == 0) ? 1 : this.allGamesStats.played))
        .toStringAsFixed(2));
    return roundedDouble;
  }

  double getGoalsConcededPerMatch() {
    double roundedDouble = double.parse((this.allGamesStats.goalsAgainst /
            ((this.allGamesStats.played == 0) ? 1 : this.allGamesStats.played))
        .toStringAsFixed(2));
    return roundedDouble;
  }

  StandingTier getTier(List<StandingTier> tiers) {
    var res = StandingTier('', Colors.transparent, 0);
    for (var element in tiers) {
      if (element.name == description) {
        res = element;
      }
    }
    return res;
  }
}

// enum StandingOutcomeEnum {
//   UCL,
//   EuropaLeague,
//   EuropaConference,
//   Normal,
//   Relegation
// }

// "description": "Promotion - Champions League (Group Stage)",
// "description": "Promotion - Europa League (Group Stage)",
// "description": "Promotion - Europa Conference League (Qualification: )"
// "description": "Relegation - Championship",
