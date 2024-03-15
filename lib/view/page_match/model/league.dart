import 'package:scoremob/data/model/fixtures_response/league.dart';
import 'package:scoremob/data/model/standings_response/standings_league.dart';

class League {
  int id;
  int season;
  String name;
  String country;
  String logo;
  String flag;
  String round;

  League(this.id, this.season, this.name, this.country, this.logo, this.flag,
      this.round);

  League.empty()
      : this.id = 0,
        this.name = '',
        this.country = '',
        this.logo = '',
        this.flag = '',
        this.round = '',
        this.season = 0;

  League.fromDTO(FixtureLeagueDTO? dto)
      : this.id = dto?.id ?? 0,
        this.name = dto?.name ?? '',
        this.country = dto?.country ?? '',
        this.logo = dto?.logo ?? '',
        this.flag = dto?.flag ?? '',
        this.round = dto?.round ?? '',
        this.season = dto?.season ?? 0;

  League.fromStandingDTO(StandingsLeagueDTO? dto)
      : this.id = dto?.id ?? 0,
        this.name = dto?.name ?? '',
        this.country = dto?.country ?? '',
        this.logo = dto?.logo ?? '',
        this.flag = dto?.flag ?? '',
        this.round = '',
        this.season = dto?.season ?? 0;

  bool isInKnockoutStage() {
    if (round.toLowerCase().contains('group')) {
      return false;
    }

    if (round.toLowerCase().contains('final')) {
      return true;
    }

    if (round.toLowerCase() == 'round of 16') {
      return true;
    }

    return false;
  }
}
// "Preliminary Round",
// "1st Round",
// "2nd Round",
// "Round of 32",
// "Round of 16",
// "Quarter-finals",
// "Semi-finals",
// "Final"

// "Preliminary Round",
// "Group Stage - 2",
// "Group Stage - 3",
// "Group Stage - 4",
// "Group Stage - 5",
// "Group Stage - 6",
// "Group Stage - 7",
// "Group Stage - 1",
// "8th Finals",
// "Quarter-finals",
// "Semi-finals",
// "3rd Place Final",
// "Final"

// "Group Stage - 1",
// "Group Stage - 2",
// "Group Stage - 3",
// "Round of 16",
// "Quarter-finals",
// "Semi-finals",
// "Final"
