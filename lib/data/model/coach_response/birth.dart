class BirthDTO {
  final String? date;
  final String? place;
  final String? country;

  BirthDTO({
    this.date,
    this.place,
    this.country,
  });

  factory BirthDTO.fromJson(Map<String, dynamic> json) => BirthDTO(
        date: json["date"],
        place: json["place"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        // "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "date": date,
        "place": place,
        "country": country,
      };
}
