part of 'team_bloc.dart';

sealed class TeamEvent extends Equatable {
  const TeamEvent();

  @override
  List<Object> get props => [];
}

final class TeamEventInit extends TeamEvent {
  const TeamEventInit(this.id, this.season, this.league);
  final int id;
  final int season;
  final int league;
}
