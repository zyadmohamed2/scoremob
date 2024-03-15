import 'dart:collection';

import 'package:scoremob/config.dart';
import 'package:scoremob/data/model/standings_response/standings_data.dart';
import 'package:scoremob/view/page_match/model/standing.dart';
import 'package:scoremob/view/page_match/model/standings_tier.dart';

import '../../../data/model/standings_response/standing.dart';
import '../../../data/model/standings_response/standings_league.dart';
import 'league.dart';

class StandingDetails {
  League league;
  List<Standing> standings;
  List<StandingTier> tiers = [];

  StandingDetails.empty()
      : this.league = League.empty(),
        this.standings = [];

  StandingDetails.fromDTO(
      StandingsLeagueDTO? leagueDTO, List<StandingDTO?>? standingsDTO)
      : this.league = League.fromStandingDTO(leagueDTO),
        this.standings =
            standingsDTO?.map((e) => Standing.fromDTO(e)).toList() ?? [] {
    _generateTiers();
  }

  Standing getStandingTeam(int teamId) {
    for (var element in standings) {
      if (element.team.id == teamId) {
        return element;
      }
    }
    return Standing.empty();
  }

  _generateTiers() {
    var promotionColors = [
      ChampionsLeagueColor,
      EuropaLeagueColor,
      EuropaConferenceLeagueColor
    ];
    var rank = 1;
    var relegationColors = [RelegationColor];
    tiers.clear();

    standings.map((e) => e.description).toSet().forEach((element) {
      if (element.toLowerCase().contains('promotion')) {
        var temp = promotionColors.firstOrNull;
        tiers.add(StandingTier(element, temp ?? DefaultPromotionColor, rank));
        promotionColors.remove(temp);
        rank++;
      }
      if (element.toLowerCase().contains('relegation')) {
        var temp = relegationColors.firstOrNull;
        tiers.add(StandingTier(element, temp ?? DefaultRelegationColor, 99));
        relegationColors.remove(temp);
      }
    });
  }
}
