import 'package:scoremob/data/model/league_response/country.dart';
import 'package:scoremob/data/model/league_response/league.dart';
import 'package:scoremob/data/model/league_response/season.dart';

class LeagueDataDTO {
  LeagueDataDTO({
    required this.league,
    required this.country,
    required this.seasons,
  });

  LeagueDTO? league;
  CountryDTO? country;
  List<SeasonDTO?>? seasons;

  LeagueDataDTO.fromJson(Map<String, dynamic> json) {
    league = LeagueDTO.fromJson(json['league']);
    country = CountryDTO.fromJson(json['country']);
    seasons =
        List.from(json['seasons']).map((e) => SeasonDTO.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['league'] = league?.toJson();
    _data['country'] = country?.toJson();
    _data['seasons'] = seasons?.map((e) => e?.toJson()).toList();
    return _data;
  }
}
