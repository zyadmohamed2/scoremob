import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoremob/data/model/fixtures_response/fixture_data.dart';
import 'package:scoremob/repo/main_repo/main_repo.dart';

import '../model/fixture.dart';
import '../model/fixture_day.dart';
import '../model/league_fixture.dart';
import 'fixtures_events.dart';
import 'fixtures_state.dart';

class FixturesBloc extends Bloc<FixturesEvent, FixturesPageState> {
  final MainRepo _mainRepo;

  FixturesBloc({required MainRepo mainRepo})
      : _mainRepo = mainRepo,
        super(FixturesPageState(
            state: FixturesPageStateEnum.Init, selectedDay: DateTime.now())) {
    //Observers
    on<FixturesEventInit>(_init);
    on<FixturesEventRefresh>(_refreshFixtures);
    on<FixturesEventClicked>(_clicked);
    on<FixturesEventChangeDate>(_changeDate);
  }

  Future<FutureOr<void>> _init(
      FixturesEventInit event, Emitter<FixturesPageState> emit) async {
    try {
      emit(state.copyWith(state: FixturesPageStateEnum.Loading));

      await _fetchFixtures(emit);
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
      emit(state.copyWith(
          state: FixturesPageStateEnum.Error, error: e.toString()));
    }
  }

  Future<void> _fetchFixtures(Emitter<FixturesPageState> emit) async {
    var result = await _mainRepo.fetchAllFixtures(
        state.getStartDay(), state.getEndDay());

    if (result.isEmpty) {
      emit(state.copyWith(
          state: FixturesPageStateEnum.Error, error: "Empty Response"));
    } else {
      emit(state.copyWith(
          state: FixturesPageStateEnum.Success,
          fixtureDays: _convertToFixtureDays(result)));
    }
  }

  FutureOr<void> _clicked(
      FixturesEventClicked event, Emitter<FixturesPageState> emit) {}

  Map<DateTime, FixtureDay> _convertToFixtureDays(
      Map<int, List<FixtureDataDTO>> result) {
    Map<DateTime, FixtureDay> res = {};

    result.forEach((leagueId, fixturesPerLeague) {
      for (var fixture in fixturesPerLeague) {
        var fixtureDay = DateUtils.dateOnly(DateTime.fromMillisecondsSinceEpoch(
            (fixture.fixture?.timestamp ?? 0) * 1000));
        var tempFixDay =
            res[fixtureDay] ?? FixtureDay(fixtureDay, <int, LeagueFixtures>{});
        var tempLeague = tempFixDay.leagueFixtures[leagueId] ??
            LeagueFixtures(
                List.empty(growable: true),
                fixture?.league?.name ?? '',
                fixture?.league?.logo ?? '',
                leagueId);
        tempLeague.fixtures.add(Fixture.fromDTO(fixture));

        tempFixDay.leagueFixtures[leagueId] = tempLeague;
        res[fixtureDay] = tempFixDay;
      }
    });
    return res;
  }

  Future<FutureOr<void>> _refreshFixtures(
    FixturesEventRefresh event,
    Emitter<FixturesPageState> emit,
  ) async {
    try {
      await _fetchFixtures(emit);
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
      if (false) {
        emit(state.copyWith(
            state: FixturesPageStateEnum.Error, error: e.toString()));
      }
    }
  }

  FutureOr<void> _changeDate(
      FixturesEventChangeDate event, Emitter<FixturesPageState> emit) async {
    emit(state.copyWith(state: FixturesPageStateEnum.Loading));
    emit(state.copyWith(selectedDate: event.newDate));
    try {
      await _fetchFixtures(emit);
    } catch (e, stackTrace) {
      debugPrint(e.toString());
      debugPrint(stackTrace.toString());
      emit(state.copyWith(
          state: FixturesPageStateEnum.Error, error: e.toString()));
    }
  }
}
