import 'package:flutter/material.dart';
import 'package:scoremob/data/model/fixtures_response/fixture_data.dart';
import 'package:scoremob/data/model/fixtures_response/fixture_goals.dart';
import 'package:scoremob/view/shared/model/team.dart';

import '../../page_match/model/goals.dart';
import '../../page_match/model/league.dart';
import '../../shared/model/fixture_status.dart';

class Fixture {
  final int id;
  final Team homeTeam;
  final Team awayTeam;
  String score;
  final Goals goals;
  final League league;
  final FixtureStatus status;

  Fixture(this.id, this.homeTeam, this.awayTeam, this.score, this.goals,
      this.league, this.status);

  Fixture.fromDTO(FixtureDataDTO? dto)
      : this.id = dto?.fixture?.id ?? 0,
        this.homeTeam = Team.fromDTO(dto?.teams?.home),
        this.awayTeam = Team.fromDTO(dto?.teams?.away),
        this.goals = Goals.fromDTO(dto?.goals, dto?.score),
        this.score = '',
        this.status = FixtureStatus.fromDTO(dto?.fixture),
        this.league = League.fromDTO(dto?.league) {
    this.score = _combineScore(dto?.goals);
  }

  String _combineScore(GoalsDTO? goals) {
    return '${goals?.home} - ${goals?.away}';
  }

  String getScoreOrTime() {
    return score.contains('null') ? status.getTime() : score;
  }

  //null if draw
  Team? getWinnerTeam() {
    if (homeTeam.winner == true) {
      return homeTeam;
    }
    if (awayTeam.winner == true) {
      return awayTeam;
    }
    return null;
  }

  Team? getLostTeam() {
    if (homeTeam.winner == true) {
      return awayTeam;
    }
    if (awayTeam.winner == true) {
      return homeTeam;
    }
    return null;
  }

  Team getOtherTeam(int teamId) {
    if (homeTeam.id == teamId) {
      return awayTeam;
    } else {
      return homeTeam;
    }
  }
}
