import 'fixtures_coverage.dart';

class CoverageDTO {
  CoverageDTO({
    required this.fixtures,
    required this.standings,
    required this.players,
    required this.topScorers,
    required this.topAssists,
    required this.topCards,
    required this.injuries,
    required this.predictions,
    required this.odds,
  });
  FixturesCoverageDTO? fixtures;
  bool? standings;
  bool? players;
  bool? topScorers;
  bool? topAssists;
  bool? topCards;
  bool? injuries;
  bool? predictions;
  bool? odds;

  CoverageDTO.fromJson(Map<String, dynamic> json) {
    fixtures = FixturesCoverageDTO.fromJson(json['fixtures']);
    standings = json['standings'];
    players = json['players'];
    topScorers = json['top_scorers'];
    topAssists = json['top_assists'];
    topCards = json['top_cards'];
    injuries = json['injuries'];
    predictions = json['predictions'];
    odds = json['odds'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fixtures'] = fixtures?.toJson();
    _data['standings'] = standings;
    _data['players'] = players;
    _data['top_scorers'] = topScorers;
    _data['top_assists'] = topAssists;
    _data['top_cards'] = topCards;
    _data['injuries'] = injuries;
    _data['predictions'] = predictions;
    _data['odds'] = odds;
    return _data;
  }
}
