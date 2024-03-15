import 'package:flutter/material.dart';
import 'package:scoremob/data/model/fixtures_response/events.dart';
import 'package:scoremob/data/model/fixtures_response/fixture_goals.dart';
import 'package:scoremob/data/model/fixtures_response/fixture_match.dart';
import 'package:scoremob/data/model/fixtures_response/fixture_score.dart';
import 'package:scoremob/data/model/fixtures_response/fixture_team_players.dart';
import 'package:scoremob/data/model/fixtures_response/fixture_teams.dart';
import 'package:scoremob/data/model/fixtures_response/league.dart';
import 'package:scoremob/data/model/fixtures_response/lineup.dart';
import 'package:scoremob/data/model/fixtures_response/statistics.dart';

class FixtureDataDTO {
  FixtureDataDTO({
    required this.fixture,
    required this.league,
    required this.teams,
    required this.goals,
    required this.score,
    required this.events, // not in H2H
    required this.lineups, // not in H2H
    required this.statistics, // not in H2H
    required this.players, // not in H2H
  });

  FixtureMatchDTO? fixture;
  FixtureLeagueDTO? league;
  TeamsDTO? teams;
  GoalsDTO? goals;
  ScoreDTO? score;
  List<EventsDTO?>? events; // only for fixture by id
  List<LineupsDTO?>? lineups; // only for fixture by id
  List<StatisticsDTO?>? statistics; // only for fixture by id
  List<FixtureTeamPlayersDTO?>? players; // only for fixture by id

  FixtureDataDTO.fromJson(Map<String, dynamic> json) {
    try {
      fixture = FixtureMatchDTO.fromJson(json['fixture']);
      league = FixtureLeagueDTO.fromJson(json['league']);
      teams = TeamsDTO.fromJson(json['teams']);
      goals = GoalsDTO.fromJson(json['goals']);
      score = ScoreDTO.fromJson(json['score']);
      events =
          List.from(json['events']).map((e) => EventsDTO.fromJson(e)).toList();
      lineups = List.from(json['lineups'])
          .map((e) => LineupsDTO.fromJson(e))
          .toList();
      statistics = List.from(json['statistics'])
          .map((e) => StatisticsDTO.fromJson(e))
          .toList();
      players = List.from(json['players'])
          .map((e) => FixtureTeamPlayersDTO.fromJson(e))
          .toList();
    } catch (e) {
      debugPrint('An error occurred: $e');
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fixture'] = fixture?.toJson();
    _data['league'] = league?.toJson();
    _data['teams'] = teams?.toJson();
    _data['goals'] = goals?.toJson();
    _data['score'] = score?.toJson();
    _data['events'] = events?.map((e) => e?.toJson()).toList();
    _data['lineups'] = lineups?.map((e) => e?.toJson()).toList();
    _data['statistics'] = statistics?.map((e) => e?.toJson()).toList();
    _data['players'] = players?.map((e) => e?.toJson()).toList();
    return _data;
  }
}
