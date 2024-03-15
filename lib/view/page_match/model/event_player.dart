import 'package:scoremob/data/model/fixtures_response/event_player.dart';

class EventPlayer {
  int id;
  String name;

  EventPlayer({required this.id, required this.name});

  EventPlayer.fromDTO(EventPlayerDTO? dto)
      : this.id = dto?.id ?? 0,
        this.name = dto?.name ?? '';
}
