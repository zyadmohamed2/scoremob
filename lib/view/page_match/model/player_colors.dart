import '../../../data/model/fixtures_response/player_colors.dart';

class PlayerColors {
  String primary;
  String number;
  String border;

  PlayerColors.empty()
      : this.primary = '',
        this.number = '',
        this.border = '';

  PlayerColors.fromDTO(PlayerColorsDTO? dto)
      : this.number = dto?.number ?? '',
        this.primary = dto?.primary ?? '',
        this.border = dto?.border ?? '';
}
