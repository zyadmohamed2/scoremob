import 'dart:convert';

class VenueInfoDTO {
  final int? id;
  final String? name;
  final String? address;
  final String? city;
  final int? capacity;
  final String? surface;
  final String? image;

  VenueInfoDTO({
    this.id,
    this.name,
    this.address,
    this.city,
    this.capacity,
    this.surface,
    this.image,
  });

  factory VenueInfoDTO.fromRawJson(String str) =>
      VenueInfoDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VenueInfoDTO.fromJson(Map<String, dynamic> json) => VenueInfoDTO(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        city: json["city"],
        capacity: json["capacity"],
        surface: json["surface"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "city": city,
        "capacity": capacity,
        "surface": surface,
        "image": image,
      };
}
