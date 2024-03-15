import 'package:scoremob/data/model/team_response/venue_info.dart';

import '../../../data/model/team_response/team_data.dart';

class Venue {
  int id;
  String name;
  String address;
  String city;
  int capacity;
  String surface;
  String image;

  Venue(this.id, this.name, this.address, this.city, this.capacity,
      this.surface, this.image);

  Venue.empty()
      : this.id = 0,
        this.name = '',
        this.address = '',
        this.city = '',
        this.capacity = 0,
        this.surface = '',
        this.image = '';

  Venue.fromDTO(VenueInfoDTO? dto)
      : this.id = dto?.id ?? 0,
        this.name = dto?.name ?? '',
        this.address = dto?.address ?? '',
        this.city = dto?.city ?? '',
        this.surface = dto?.surface ?? '',
        this.image = dto?.image ?? '',
        this.capacity = dto?.capacity ?? 0;
}
