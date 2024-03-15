import '../../../data/model/players_response/birth.dart';

class Birth {
  String date;
  String place;
  String country;

  Birth(this.date, this.place, this.country);

  Birth.empty()
      : this.date = '',
        this.country = '',
        this.place = '';

  Birth.fromDTO(PlayerBirthDTO? dto)
      : this.country = dto?.country ?? '',
        this.date = dto?.date ?? '',
        this.place = dto?.place ?? '';
}
