import 'package:scoremob/view/page_tournament/model/season.dart';

import '../../../data/model/league_response/country.dart';

class Country {
  String name;
  String code;
  String flag;

  Country(this.name, this.code, this.flag);

  Country.empty()
      : name = '',
        code = '',
        flag = '';

  Country.fromDTO(CountryDTO? dto)
      : name = dto?.name ?? '',
        code = dto?.code ?? '',
        flag = dto?.flag ?? '';
}
