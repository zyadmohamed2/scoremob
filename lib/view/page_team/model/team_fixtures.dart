import 'package:scoremob/data/model/fixtures_response/fixture_data.dart';

import '../../page_fixtures/model/fixture.dart';

class TeamFixtures {
  List<Fixture> next = [];
  List<Fixture> last = [];

  TeamFixtures({required this.next, required this.last});

  TeamFixtures.empty();

  TeamFixtures.fromDTO(List<FixtureDataDTO?> next, List<FixtureDataDTO?> last) {
    this.next = next.map((e) => Fixture.fromDTO(e)).toList();
    this.last = last.map((e) => Fixture.fromDTO(e)).toList();
  }

  Fixture? getNextMatch() {
    return next.firstOrNull;
  }

  List<Fixture> getLast5Matches() {
    return last.take(5).toList();
  }

  List<Fixture> get10UpcomingMatches() {
    return next;
  }
}
