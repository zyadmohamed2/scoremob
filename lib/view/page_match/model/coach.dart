import '../../../data/model/fixtures_response/coach.dart';

class Coach {
  int id;
  String name;
  String photo;

  Coach.empty()
      : this.id = 0,
        this.photo = '',
        this.name = '';

  Coach.fromDTO(CoachDTO? dto)
      : this.name = dto?.name ?? '',
        this.id = dto?.id ?? 0,
        this.photo = dto?.photo ?? '';

  bool isEmpty() {
    return (name.isEmpty && photo.isEmpty);
  }
}
