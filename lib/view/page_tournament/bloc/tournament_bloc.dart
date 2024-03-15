import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoremob/view/page_tournament/bloc/tournament_event.dart';
import 'package:scoremob/view/page_tournament/bloc/tournament_state.dart';
import 'package:scoremob/view/page_tournament/model/league_data.dart';

import '../../../repo/main_repo/main_repo.dart';
import '../../page_match/model/standing_details.dart';
import '../../page_team/model/team_fixtures.dart';
import '../model/fixtures_by_day.dart';

class TournamentBloc extends Bloc<TournamentEvent, TournamentPageState> {
  final MainRepo _mainRepo;
  int? tournamentId;

  TournamentBloc({required MainRepo mainRepo})
      : _mainRepo = mainRepo,
        super(TournamentPageState(state: TournamentPageStateEnum.Init)) {
    //Observers
    on<TournamentEventInit>(_init);
  }

  Future<FutureOr<void>> _init(
      TournamentEventInit event, Emitter<TournamentPageState> emit) async {
    try {
      emit(state.copyWith(state: TournamentPageStateEnum.Loading));

      await _fetchInitData(emit, event.id, event.season);
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stackTrace);
      emit(state.copyWith(
          state: TournamentPageStateEnum.Error, error: e.toString()));
    }
  }

  Future<void> _fetchInitData(
      Emitter<TournamentPageState> emit, int id, int season) async {
    try {
      var futureLeague = _mainRepo.fetchLeagueById(id);
      var futureStandings = _mainRepo.fetchLeagueStandings(id, season);
      var futureFixtures = _mainRepo.fetchFixturesByLeague(id, season);
      var futureLeagueType = _mainRepo.getLeagueType(id);

      var league = LeagueData.fromDTO(await futureLeague);
      var fixtures = FixturesByDay.fromDTO(await futureFixtures);
      var leagueType = await futureLeagueType;

      var responseStandings = await futureStandings;

      List<StandingDetails> standings = [];
      responseStandings?.league?.standings?.forEach((element) {
        standings
            .add(StandingDetails.fromDTO(responseStandings.league, element));
      });

      emit(state.copyWith(
        state: TournamentPageStateEnum.Success,
        standingDetails: standings,
        fixtures: fixtures,
        league: league,
        leagueTypeEnum: leagueType,
      ));
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stackTrace);
      emit(state.copyWith(
          state: TournamentPageStateEnum.Error, error: e.toString()));
    }
  }
}
