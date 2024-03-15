import 'package:scoremob/config.dart';
import 'package:scoremob/data/model/standings_response/standings_data.dart';

class CachedStanding {
  StandingsDataDTO value;
  late DateTime timestamp;

  CachedStanding({required this.value}) {
    timestamp = DateTime.now();
  }

  bool isValid() {
    var diff = DateTime.now().difference(this.timestamp);
    return (diff.inSeconds <= STANDINGS_CACHE_TIMEOUT);
  }
}
