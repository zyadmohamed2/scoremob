import 'package:scoremob/view/page_tournament/model/season.dart';

import '../../../data/model/league_response/league_data.dart';
import '../../../data/model/league_response/season.dart';
import 'country.dart';

class LeagueData {
  int id;
  String name;
  String type;
  String logo;
  Country country;
  List<Season> seasons;

  LeagueData(
      this.id, this.name, this.type, this.logo, this.country, this.seasons);

  LeagueData.empty()
      : id = 0,
        name = '',
        type = '',
        seasons = [],
        country = Country.empty(),
        logo = '';

  LeagueData.fromDTO(LeagueDataDTO? dto)
      : id = dto?.league?.id ?? 0,
        name = dto?.league?.name ?? '',
        type = dto?.league?.type ?? '',
        country = Country.fromDTO(dto?.country),
        logo = dto?.league?.logo ?? '',
        seasons = _parseSeasons(dto?.seasons ?? []);

  static List<Season> _parseSeasons(List<SeasonDTO?> list) {
    var res = <Season>[];

    list.forEach((element) {
      res.add(Season.fromDTO(element));
    });

    return res;
  }
}
