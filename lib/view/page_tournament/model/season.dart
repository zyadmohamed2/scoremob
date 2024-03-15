import '../../../data/model/league_response/season.dart';

class Season {
  int year;
  String start;
  String end;
  bool current;

  // Coverage coverage;

  Season(this.year, this.start, this.end, this.current);

  Season.empty()
      : year = 0,
        start = '',
        end = '',
        current = false;

  Season.fromDTO(SeasonDTO? dto)
      : year = dto?.year ?? 0,
        start = dto?.start ?? '',
        end = dto?.end ?? '',
        current = dto?.current ?? false;
}
