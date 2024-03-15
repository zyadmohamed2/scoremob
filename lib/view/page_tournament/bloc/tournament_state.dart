import 'package:equatable/equatable.dart';

import '../../../repo/main_repo/model/league_type.dart';
import '../../page_match/model/standing_details.dart';
import '../model/fixtures_by_day.dart';
import '../model/league_data.dart';

enum TournamentPageStateEnum { Init, Loading, Error, Success }

final class TournamentPageState extends Equatable {
  String? error;
  TournamentPageStateEnum state;
  LeagueTypeEnum leagueType = LeagueTypeEnum.league;
  List<StandingDetails> standingDetails = [];
  FixturesByDay fixtures = FixturesByDay.empty();
  LeagueData league = LeagueData.empty();

  TournamentPageState({required this.state});

  TournamentPageState.all({
    required this.state,
    required this.error,
    required this.leagueType,
    required this.standingDetails,
    required this.fixtures,
    required this.league,
  });

  @override
  List<Object?> get props =>
      [error, state, leagueType, standingDetails, fixtures, league];

  TournamentPageState copyWith({
    String? error,
    TournamentPageStateEnum? state,
    LeagueTypeEnum? leagueTypeEnum,
    List<StandingDetails>? standingDetails,
    FixturesByDay? fixtures,
    LeagueData? league,
  }) {
    return TournamentPageState.all(
      error: error ?? this.error,
      state: state ?? this.state,
      leagueType: leagueTypeEnum ?? this.leagueType,
      league: league ?? this.league,
      fixtures: fixtures ?? this.fixtures,
      standingDetails: standingDetails ?? this.standingDetails,
    );
  }
}
