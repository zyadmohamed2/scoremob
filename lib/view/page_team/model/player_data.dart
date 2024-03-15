import 'package:scoremob/data/model/players_response/stastic.dart';

import '../../../data/model/players_response/player_data.dart';
import '../../res/strings.dart';
import 'birth.dart';

class PlayerData {
  int id;
  String name;
  String firstname;
  String lastname;
  int age;
  String nationality;
  String height;
  String weight;
  bool injured;
  String photo;
  Birth birth;
  List<StatisticDTO> _statistics = [];

  PlayerData(
      this.id,
      this.name,
      this.firstname,
      this.lastname,
      this.age,
      this.nationality,
      this.height,
      this.weight,
      this.injured,
      this.photo,
      this.birth,
      this._statistics);

  PlayerData.empty()
      : this.id = 0,
        this.nationality = '',
        this.name = '',
        this.photo = '',
        this.lastname = '',
        this.firstname = '',
        this.age = 0,
        this.birth = Birth.empty(),
        this.height = '',
        this.weight = '',
        this.injured = false;

  PlayerData.fromDTO(PlayerDataDTO? dto)
      : this.id = dto?.player?.id ?? 0,
        this.name = dto?.player?.name ?? '',
        this.firstname = dto?.player?.firstname ?? '',
        this.lastname = dto?.player?.lastname ?? '',
        this.age = dto?.player?.age ?? 0,
        this.nationality = dto?.player?.nationality ?? '',
        this.height = dto?.player?.height ?? '',
        this.weight = dto?.player?.weight ?? '',
        this.injured = dto?.player?.injured ?? false,
        this.photo = dto?.player?.photo ?? '',
        this._statistics = dto?.statistics ?? [],
        this.birth = Birth.fromDTO(dto?.player?.birth);

  String getPosition() {
    var defaultPos = resStrPlayer;
    var res = resStrPlayer;
    _statistics.forEach((element) {
      if (element.games?.position != null) {
        res = element.games?.position ?? defaultPos;
      }
    });

    return res;
  }
}
