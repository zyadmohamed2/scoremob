class FixturesCoverageDTO {
  FixturesCoverageDTO({
    required this.events,
    required this.lineups,
    required this.statisticsFixtures,
    required this.statisticsPlayers,
  });

  bool? events;
  bool? lineups;
  bool? statisticsFixtures;
  bool? statisticsPlayers;

  FixturesCoverageDTO.fromJson(Map<String, dynamic> json) {
    events = json['events'];
    lineups = json['lineups'];
    statisticsFixtures = json['statistics_fixtures'];
    statisticsPlayers = json['statistics_players'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['events'] = events;
    _data['lineups'] = lineups;
    _data['statistics_fixtures'] = statisticsFixtures;
    _data['statistics_players'] = statisticsPlayers;
    return _data;
  }
}
