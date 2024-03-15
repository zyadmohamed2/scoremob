import 'package:scoremob/data/model/shared/team.dart';

class EventTeam {
  int id;
  String name;
  String logo;

  EventTeam({required this.id, required this.name, required this.logo});

  EventTeam.fromDTO(TeamDTO? dto)
      : this.id = dto?.id ?? 0,
        this.name = dto?.name ?? '',
        this.logo = dto?.logo ?? '';
}
