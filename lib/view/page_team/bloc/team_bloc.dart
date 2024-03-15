import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoremob/repo/main_repo/main_repo.dart';
import 'package:scoremob/view/page_match/model/standing_details.dart';
import 'package:scoremob/view/page_team/model/players.dart';
import 'package:scoremob/view/page_team/model/team_fixtures.dart';
import 'package:scoremob/view/page_team/model/transfers.dart';

import '../../../data/model/standings_response/standing.dart';
import '../../../repo/main_repo/model/league_type.dart';
import '../model/team_coaches.dart';
import '../model/team_info.dart';

part 'team_event.dart';

part 'team_state.dart';

class TeamBloc extends Bloc<TeamEvent, TeamPageState> {
  final MainRepo _mainRepo;
  int? teamId;

  TeamBloc({required MainRepo mainRepo})
      : _mainRepo = mainRepo,
        super(TeamPageState(state: TeamPageStateEnum.Init)) {
    //Observers
    on<TeamEventInit>(_init);
    // on<MatchEventRefresh>(_refreshFixtures);
    // on<MatchEventPageLoaded>(_fetchAdditionalInfo);
  }

  Future<FutureOr<void>> _init(
      TeamEventInit event, Emitter<TeamPageState> emit) async {
    try {
      emit(state.copyWith(state: TeamPageStateEnum.Loading));

      await _fetchInitData(emit, event.id, event.league, event.season);
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stackTrace);
      emit(state.copyWith(state: TeamPageStateEnum.Error, error: e.toString()));
    }
  }

  Future<void> _fetchInitData(
      Emitter<TeamPageState> emit, int id, int league, int season) async {
    try {
      var futureNextFixtures = _mainRepo.fetchNextFixtureForTeam(id);
      var futureLastFixtures = _mainRepo.fetchLastFixtureForTeam(id);
      var futureStandings = _mainRepo.fetchLeagueStandings(league, season);
      var futurePlayers = _mainRepo.fetchTeamPlayers(season, id);
      var futureTeam = _mainRepo.fetchTeamInfo(id);
      var futureTransfers = _mainRepo.fetchTeamTransfers(id, league);
      var futureCoaches = _mainRepo.fetchTeamCoaches(id);
      var futureLeagueType = _mainRepo.getLeagueType(league);

      var teamFixtures = TeamFixtures.fromDTO(
          (await futureNextFixtures) ?? [], (await futureLastFixtures) ?? []);
      var players = Players.fromDTO((await futurePlayers));
      var team = TeamInfo.fromDTO((await futureTeam));
      var transfers = Transfers.fromDTO(await futureTransfers, id);
      var coaches = TeamCoaches.fromDTO(await futureCoaches, id);
      var leagueType = await futureLeagueType;

      var responseStandings = await futureStandings;
      List<StandingDTO>? standing;
      if (responseStandings?.league?.standings?.length == 1) {
        standing = responseStandings?.league?.standings?.firstOrNull;
      } else {
        responseStandings?.league?.standings?.forEach((element) {
          for (var value in element) {
            if (value.team?.id == id) {
              standing = element;
            }
          }
        });
      }

      var standingsDetail =
          StandingDetails.fromDTO(responseStandings?.league, standing);

      emit(state.copyWith(
          state: TeamPageStateEnum.Success,
          teamFixtures: teamFixtures,
          standingDetails: standingsDetail,
          players: players,
          teamInfo: team,
          leagueTypeEnum: leagueType,
          coaches: coaches,
          transfers: transfers));
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: stackTrace);
      emit(state.copyWith(state: TeamPageStateEnum.Error, error: e.toString()));
    }
  }
}
