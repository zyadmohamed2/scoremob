import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoremob/data/model/fixtures_response/fixture_data.dart';
import 'package:scoremob/data/model/standings_response/standing.dart';
import 'package:scoremob/repo/main_repo/main_repo.dart';
import 'package:scoremob/repo/main_repo/model/league_type.dart';
import 'package:scoremob/view/page_fixtures/model/fixture.dart';

import '../model/fixture_details.dart';
import '../model/h2h_data.dart';
import '../model/standing_details.dart';
import 'match_events.dart';
import 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchPageState> {
  final MainRepo _mainRepo;
  int? fixtureId;

  MatchBloc({required MainRepo mainRepo})
      : _mainRepo = mainRepo,
        super(MatchPageState(state: MatchPageStateEnum.Init)) {
    //Observers
    on<MatchEventInit>(_init);
    on<MatchEventRefresh>(_refreshFixtures);
    on<MatchEventPageLoaded>(_fetchAdditionalInfo);
  }

  Future<FutureOr<void>> _init(
      MatchEventInit event, Emitter<MatchPageState> emit) async {
    try {
      emit(state.copyWith(state: MatchPageStateEnum.Loading));

      await _fetchFixture(emit, event.id);
      this.fixtureId = event.id;
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stackTrace);
      emit(
          state.copyWith(state: MatchPageStateEnum.Error, error: e.toString()));
    }
  }

  Future<FutureOr<void>> _refreshFixtures(
      MatchEventRefresh event, Emitter<MatchPageState> emit) async {
    try {
      if (fixtureId != null) {
        await _fetchFixture(emit, fixtureId ?? 0);
      }
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
      // emit(state.copyWith(
      //     state: FixturesPageStateEnum.Error, error: e.toString()));
    }
  }

  Future<void> _fetchFixture(Emitter<MatchPageState> emit, int id) async {
    var result = await _mainRepo.fetchFixture(id);

    if (result == null) {
      emit(state.copyWith(
          state: MatchPageStateEnum.Error, error: "Empty Response"));
    } else {
      var details = FixtureDetails.fromDTO(result);
      var leagueType = await _mainRepo.getLeagueType(details.league.id);

      emit(state.copyWith(
          state: MatchPageStateEnum.Success,
          fixtureDetails: details,
          leagueTypeEnum: leagueType));
    }
  }

  FutureOr<void> _fetchAdditionalInfo(
      MatchEventPageLoaded event, Emitter<MatchPageState> emit) async {
    try {
      emit(state.copyWith(
        tableState: MatchPageTabsStateEnum.Loading,
        h2hState: MatchPageTabsStateEnum.Loading,
      ));
      var isKnockout = state.fixtureDetails.league.isInKnockoutStage();

      var futureStandingsResponse =
          _mainRepo.fetchLeagueStandings(event.leagueId, event.season);
      var futureH2hResponse =
          _mainRepo.fetchH2H(event.homeTeamId, event.awayTeamId);
      Future<List<FixtureDataDTO>?>? futureKnockoutFixtures;
      if (isKnockout) {
        futureKnockoutFixtures = _mainRepo.fetchFixturesByRound(
            event.leagueId, event.season, state.fixtureDetails.league.round);
      }

      var responseStandings = await futureStandingsResponse;
      var responseH2h = await futureH2hResponse;
      var knockoutFixtures = <FixtureDataDTO>[];
      if (isKnockout) {
        knockoutFixtures = (await futureKnockoutFixtures) ?? [];
      }

      if (responseStandings == null) {
        emit(state.copyWith(
            tableState: MatchPageTabsStateEnum.Error,
            tableError: "Empty Response"));
      } else {
        List<StandingDTO>? standing;
        if (responseStandings.league?.standings?.length == 1) {
          standing = responseStandings.league?.standings?.firstOrNull;
        } else {
          responseStandings.league?.standings?.forEach((element) {
            for (var value in element) {
              if (value.team?.id == event.homeTeamId ||
                  value.team?.id == event.awayTeamId) {
                standing = element;
              }
            }
          });
        }
        emit(state.copyWith(
            tableState: MatchPageTabsStateEnum.Success,
            standingDetails:
                StandingDetails.fromDTO(responseStandings.league, standing)));
      }

      if (responseH2h == null) {
        emit(state.copyWith(
            h2hState: MatchPageTabsStateEnum.Error,
            h2hError: "Empty Response"));
      } else {
        emit(state.copyWith(
            h2hState: MatchPageTabsStateEnum.Success,
            h2hData: H2hData.fromDTO(responseH2h)));
        // h2hData: H2hData.empty()));
      }
      if (isKnockout) {
        if (knockoutFixtures.isEmpty) {
          emit(state.copyWith(
              knockoutsState: MatchPageTabsStateEnum.Error,
              knockoutsError: "Empty Response"));
        } else {
          emit(state.copyWith(
              knockouts:
                  knockoutFixtures.map((e) => Fixture.fromDTO(e)).toList(),
              knockoutsState: MatchPageTabsStateEnum.Success));
        }
      }
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
      emit(state.copyWith(
          h2hState: MatchPageTabsStateEnum.Error,
          h2hError: e.toString(),
          tableState: MatchPageTabsStateEnum.Error,
          tableError: e.toString()));
    }
  }
}
