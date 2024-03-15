part of 'team_bloc.dart';

enum TeamPageStateEnum { Init, Loading, Error, Success }

final class TeamPageState extends Equatable {
  String? error;
  TeamPageStateEnum state;
  LeagueTypeEnum leagueType = LeagueTypeEnum.league;

  TeamFixtures teamFixtures = TeamFixtures.empty();
  StandingDetails standingDetails = StandingDetails.empty();
  Players players = Players.empty();
  TeamInfo teamInfo = TeamInfo.empty();
  Transfers transfers = Transfers.empty();
  TeamCoaches coaches = TeamCoaches.empty();

  TeamPageState({required this.state});

  TeamPageState.all({
    required this.state,
    required this.error,
    required this.teamFixtures,
    required this.standingDetails,
    required this.players,
    required this.leagueType,
    required this.teamInfo,
    required this.transfers,
    required this.coaches,
  });

  @override
  List<Object?> get props => [
        error,
        state,
        teamFixtures,
        standingDetails,
        players,
        leagueType,
        teamInfo,
        transfers,
        coaches,
      ];

  TeamPageState copyWith(
      {String? error,
      TeamPageStateEnum? state,
      TeamFixtures? teamFixtures,
      StandingDetails? standingDetails,
      Players? players,
      TeamInfo? teamInfo,
      LeagueTypeEnum? leagueTypeEnum,
      TeamCoaches? coaches,
      Transfers? transfers}) {
    return TeamPageState.all(
      error: error ?? this.error,
      state: state ?? this.state,
      leagueType: leagueTypeEnum ?? this.leagueType,
      teamFixtures: teamFixtures ?? this.teamFixtures,
      standingDetails: standingDetails ?? this.standingDetails,
      players: players ?? this.players,
      coaches: coaches ?? this.coaches,
      teamInfo: teamInfo ?? this.teamInfo,
      transfers: transfers ?? this.transfers,
    );
  }
}
