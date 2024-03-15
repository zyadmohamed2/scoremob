import 'package:equatable/equatable.dart';

sealed class MatchEvent extends Equatable {
  const MatchEvent();

  @override
  List<Object> get props => [];
}

final class MatchEventInit extends MatchEvent {
  const MatchEventInit(this.id);
  final int id;
}

final class MatchEventRefresh extends MatchEvent {
  const MatchEventRefresh();
}

final class MatchEventPageLoaded extends MatchEvent {
  const MatchEventPageLoaded(
      this.leagueId, this.season, this.homeTeamId, this.awayTeamId);
  final int leagueId;
  final int season;
  final int homeTeamId;
  final int awayTeamId;
}
