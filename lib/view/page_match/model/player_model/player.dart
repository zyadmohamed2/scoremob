import 'birth.dart';

class Player {
  int? id;
  String? name;
  String? firstname;
  String? lastname;
  int? age;
  Birth? birth;
  String? nationality;
  String? height;
  String? weight;
  bool? injured;
  String? photo;

  Player({
    this.id,
    this.name,
    this.firstname,
    this.lastname,
    this.age,
    this.birth,
    this.nationality,
    this.height,
    this.weight,
    this.injured,
    this.photo,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json['id'] as int?,
        name: json['name'] as String?,
        firstname: json['firstname'] as String?,
        lastname: json['lastname'] as String?,
        age: json['age'] as int?,
        birth: json['birth'] == null
            ? null
            : Birth.fromJson(json['birth'] as Map<String, dynamic>),
        nationality: json['nationality'] as String?,
        height: json['height'] as String?,
        weight: json['weight'] as String?,
        injured: json['injured'] as bool?,
        photo: json['photo'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'firstname': firstname,
        'lastname': lastname,
        'age': age,
        'birth': birth?.toJson(),
        'nationality': nationality,
        'height': height,
        'weight': weight,
        'injured': injured,
        'photo': photo,
      };
}
