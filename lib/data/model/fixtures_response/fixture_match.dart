import 'fixture_status.dart';
import 'periods.dart';
import 'venue.dart';

class FixtureMatchDTO {
  FixtureMatchDTO({
    required this.id,
    this.referee,
    required this.timezone,
    required this.date,
    required this.timestamp,
    required this.periods,
    required this.venue,
    required this.status,
  });
  int? id;
  String? referee;
  String? timezone;
  String? date;
  int? timestamp;
  PeriodsDTO? periods;
  VenueDTO? venue;
  StatusDTO? status;

  FixtureMatchDTO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referee = json['referee'];
    timezone = json['timezone'];
    date = json['date'];
    timestamp = json['timestamp'];
    periods = PeriodsDTO.fromJson(json['periods']);
    venue = VenueDTO.fromJson(json['venue']);
    status = StatusDTO.fromJson(json['status']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['referee'] = referee;
    _data['timezone'] = timezone;
    _data['date'] = date;
    _data['timestamp'] = timestamp;
    _data['periods'] = periods?.toJson();
    _data['venue'] = venue?.toJson();
    _data['status'] = status?.toJson();
    return _data;
  }
}
