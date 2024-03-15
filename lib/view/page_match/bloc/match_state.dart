import 'package:equatable/equatable.dart';
import 'package:scoremob/view/page_fixtures/model/fixture.dart';

import '../../../repo/main_repo/model/league_type.dart';
import '../model/fixture_details.dart';
import '../model/h2h_data.dart';
import '../model/standing_details.dart';

enum MatchPageStateEnum { Init, Loading, Error, Success }

enum MatchPageTabsStateEnum { Loading, Error, Success }

final class MatchPageState extends Equatable {
  String? error;
  MatchPageStateEnum state;
  LeagueTypeEnum leagueType = LeagueTypeEnum.league;
  FixtureDetails fixtureDetails = FixtureDetails.empty();

//Standings
  String? tableError;
  MatchPageTabsStateEnum tableState = MatchPageTabsStateEnum.Loading;
  StandingDetails standingDetails = StandingDetails.empty();

//H2H
  String? h2hError;
  MatchPageTabsStateEnum h2hState = MatchPageTabsStateEnum.Loading;
  H2hData h2hDetails = H2hData.empty();

  //knockout
  String? knockoutError;
  MatchPageTabsStateEnum knockoutState = MatchPageTabsStateEnum.Loading;
  List<Fixture> knockoutFixtures = [];

  MatchPageState({required this.state});

  MatchPageState.all({
    required this.state,
    required this.error,
    required this.fixtureDetails,
    this.tableError,
    required this.knockoutFixtures,
    required this.knockoutError,
    required this.knockoutState,
    required this.leagueType,
    required this.tableState,
    required this.standingDetails,
    required this.h2hDetails,
    required this.h2hError,
    required this.h2hState,
  });

  @override
  List<Object?> get props => [
        error,
        state,
        leagueType,
        fixtureDetails,
        tableError,
        knockoutFixtures,
        knockoutState,
        knockoutError,
        tableState,
        standingDetails,
        h2hError,
        h2hState,
        h2hDetails
      ];

  bool shouldShowKnockoutTab() {
    if (leagueType == LeagueTypeEnum.league) {
      return false;
    }
    if (fixtureDetails.league.isInKnockoutStage()) {
      return true;
    }
    return false;
  }

  MatchPageState copyWith({
    String? error,
    MatchPageStateEnum? state,
    FixtureDetails? fixtureDetails,
    String? tableError,
    MatchPageTabsStateEnum? tableState,
    StandingDetails? standingDetails,
    H2hData? h2hData,
    String? h2hError,
    List<Fixture>? knockouts,
    String? knockoutsError,
    MatchPageTabsStateEnum? knockoutsState,
    LeagueTypeEnum? leagueTypeEnum,
    MatchPageTabsStateEnum? h2hState,
  }) {
    return MatchPageState.all(
      error: error ?? this.error,
      state: state ?? this.state,
      fixtureDetails: fixtureDetails ?? this.fixtureDetails,
      standingDetails: standingDetails ?? this.standingDetails,
      tableState: tableState ?? this.tableState,
      tableError: tableError ?? this.tableError,
      h2hDetails: h2hData ?? this.h2hDetails,
      knockoutFixtures: knockouts ?? this.knockoutFixtures,
      knockoutError: knockoutsError ?? this.knockoutError,
      knockoutState: knockoutsState ?? this.knockoutState,
      leagueType: leagueTypeEnum ?? this.leagueType,
      h2hState: h2hState ?? this.h2hState,
      h2hError: h2hError ?? this.h2hError,
    );
  }
}
