import 'package:scoremob/view/page_match/model/player_colors.dart';

import '../../../data/model/fixtures_response/lineup_colors.dart';

class TeamColors {
  PlayerColors player;
  PlayerColors goalkeeper;

  TeamColors.empty()
      : this.player = PlayerColors.empty(),
        this.goalkeeper = PlayerColors.empty();

  TeamColors.fromDTO(LineupColorsDTO? dto)
      : this.player = PlayerColors.fromDTO(dto?.player),
        this.goalkeeper = PlayerColors.fromDTO(dto?.goalkeeper);
}
