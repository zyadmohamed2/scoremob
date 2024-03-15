import 'package:scoremob/data/model/fixtures_response/coach.dart';
import 'package:scoremob/data/model/fixtures_response/lineup.dart';
import 'package:scoremob/data/model/fixtures_response/lineup_colors.dart';
import 'package:scoremob/data/model/fixtures_response/player_colors.dart';
import 'package:scoremob/data/model/fixtures_response/start_xi_player.dart';
import 'package:scoremob/view/page_match/model/team_colors.dart';
import 'package:scoremob/view/res/strings.dart';
import 'package:scoremob/view/shared/model/team.dart';

import 'coach.dart';
import 'lineup_player.dart';

class Lineup {
  Team team;
  TeamColors colors;
  Coach coach;
  String formation;
  List<LineupPlayer> startXI;
  List<LineupPlayer> substitutes;

  Lineup.empty()
      : this.team = Team.empty(),
        this.colors = TeamColors.empty(),
        this.coach = Coach.empty(),
        this.formation = '',
        this.startXI = [],
        this.substitutes = [];

  Lineup.fromDTO(LineupsDTO? dto)
      : this.team = Team.fromLineupDTO(dto?.team),
        this.colors = TeamColors.fromDTO(dto?.team?.colors),
        this.coach = Coach.fromDTO(dto?.coach),
        this.formation = dto?.formation ?? '',
        this.startXI = dto?.startXI
                ?.map((e) => LineupPlayer.fromDTO(e?.player))
                .toList() ??
            [],
        this.substitutes = dto?.substitutes
                ?.map((e) => LineupPlayer.fromDTO(e?.player))
                .toList() ??
            [];

  int getVLines() {
    return this.formation.replaceAll('-', '').length;
  }

  int getHLines() {
    var filtered = this.formation.replaceAll('-', '');
    int max = 0;
    for (int i = 0; i < filtered.length; i++) {
      int digit = int.tryParse(filtered[i]) ?? 0;
      if (digit > max) {
        max = digit;
      }
    }
    return max;
  }
}
