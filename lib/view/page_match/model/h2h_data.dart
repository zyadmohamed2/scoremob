import 'package:scoremob/data/model/fixtures_response/fixture_data.dart';

import '../../page_fixtures/model/fixture.dart';

class H2hData {
  List<Fixture> fixtures;

  int homeWins = 0;
  int awayWins = 0;
  int draws = 0;

  H2hData.empty() : this.fixtures = [];

  H2hData.fromDTO(List<FixtureDataDTO>? dto)
      : this.fixtures = dto?.map((e) => Fixture.fromDTO(e)).toList() ?? [] {
    fixtures.forEach((element) {
      if (element.homeTeam.winner == true) {
        homeWins += 1;
      }
      if (element.awayTeam.winner == true) {
        awayWins += 1;
      }
      if (element.goals.isDraw()) {
        draws += 1;
      }
    });
  }
}
