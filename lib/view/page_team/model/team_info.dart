import 'package:scoremob/data/model/team_response/team_data.dart';
import 'package:scoremob/view/page_team/model/venue.dart';

class TeamInfo {
  int id;
  String name;
  String code;
  String country;
  String logo;
  int founded;
  bool national;
  Venue venue;

  TeamInfo(this.id, this.name, this.code, this.country, this.logo, this.founded,
      this.national, this.venue);

  TeamInfo.empty()
      : this.id = 0,
        this.name = '',
        this.code = '',
        this.country = '',
        this.logo = '',
        this.founded = 0,
        this.venue = Venue.empty(),
        this.national = false;

  TeamInfo.fromDTO(TeamDataDTO? dto)
      : this.id = dto?.team?.id ?? 0,
        this.founded = dto?.team?.founded ?? 0,
        this.name = dto?.team?.name ?? '',
        this.code = dto?.team?.code ?? '',
        this.country = dto?.team?.country ?? '',
        this.logo = dto?.team?.logo ?? '',
        this.venue = Venue.fromDTO(dto?.venue),
        this.national = dto?.team?.national ?? false;
}
