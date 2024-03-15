import 'package:equatable/equatable.dart';

sealed class TournamentEvent extends Equatable {
  const TournamentEvent();

  @override
  List<Object> get props => [];
}

final class TournamentEventInit extends TournamentEvent {
  const TournamentEventInit(this.id, this.season);

  final int id;
  final int season;
}
