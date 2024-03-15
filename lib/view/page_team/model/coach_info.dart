import '../../../data/model/coach_response/coach_info.dart';
import '../../shared/model/team.dart';

class CoachInfo {
  int id;
  String name;
  String firstname;
  String lastname;
  int age;
  String nationality;
  String photo;
  Team team;

  CoachInfo(this.id, this.name, this.firstname, this.lastname, this.age,
      this.nationality, this.photo, this.team);

  CoachInfo.empty()
      : this.id = 0,
        this.name = '',
        this.age = 0,
        this.firstname = '',
        this.lastname = '',
        this.team = Team.empty(),
        this.nationality = '',
        this.photo = '';

  CoachInfo.fromDTO(CoachInfoDTO? dto)
      : this.id = dto?.id ?? 0,
        this.name = dto?.name ?? '',
        this.age = dto?.age ?? 0,
        this.firstname = dto?.firstname ?? '',
        this.lastname = dto?.lastname ?? '',
        this.team = Team.fromDTO(dto?.team),
        this.nationality = dto?.nationality ?? '',
        this.photo = dto?.photo ?? '';
}
