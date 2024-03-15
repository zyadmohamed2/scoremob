import '../../../data/model/fixtures_response/start_xi_player.dart';
import '../../res/strings.dart';

class LineupPlayer {
  int id;
  String name;
  int number;
  String pos;
  String _grid;

  LineupPlayer.empty()
      : this.id = 0,
        this.number = 0,
        this.pos = '',
        this._grid = '',
        this.name = '';

  LineupPlayer.fromDTO(StartXIPlayerDTO? dto)
      : this.id = dto?.id ?? 0,
        this.name = dto?.name ?? '',
        this.number = dto?.number ?? 0,
        this.pos = dto?.pos ?? '',
        this._grid = dto?.grid ?? '';

  int getVLine() {
    return ((int.tryParse(_grid[0])) ?? 1) - 1;
  }

  int getHLine() {
    return (int.tryParse(_grid[2]) ?? 1) - 1;
  }

  bool isGoalkeeper() {
    return (this.pos.toLowerCase() == 'g');
  }

  String getPositionTitle() {
    switch (pos.toLowerCase()) {
      case 'g':
        return resStrGoalKeeper;
      case 'd':
        return resStrDefender;
      case 'm':
        return resStrMidfielder;
      case 'f':
        return resStAttacker;
    }
    return resStrPlayer;
  }
}
