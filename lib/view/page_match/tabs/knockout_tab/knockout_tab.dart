import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_fixtures/model/fixture.dart';
import 'package:scoremob/view/page_match/tabs/knockout_tab/match_small_card/match_small_card.dart';
import 'package:scoremob/view/res/strings.dart';

import '../../../page_tournament/tournament_page.dart';
import '../../../shared/widget/loading_view.dart';
import '../../bloc/match_bloc.dart';
import '../../bloc/match_state.dart';

class KnockoutTab extends StatelessWidget {
  const KnockoutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchBloc, MatchPageState>(builder: (context, state) {
      switch (state.knockoutState) {
        case MatchPageTabsStateEnum.Loading:
          return const LoadingView();
        case MatchPageTabsStateEnum.Error:
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text(state.knockoutError ?? 'Unknown Error')),
          );
        case MatchPageTabsStateEnum.Success:
          {
            int midpoint = state.knockoutFixtures.length ~/ 2;

            return Container(
              color: const Color(0xfff5f5f5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.spaceEvenly,
                      direction: Axis.horizontal,
                      children: _generateSquares(
                          state.knockoutFixtures.sublist(0, midpoint))),
                  Gap(22.h),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TournamentPage(
                                  tournamentId:
                                      state.knockoutFixtures.first.league.id,
                                  season: state
                                      .knockoutFixtures.first.league.season)),
                        );
                      },
                      child: Text(resStrSeeAllMatches)),
                  Gap(22.h),
                  Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.spaceEvenly,
                      direction: Axis.horizontal,
                      children: _generateSquares(
                          state.knockoutFixtures.sublist(midpoint))),
                ],
              ),
            );
          }
      }
    });
  }

  List<Widget> _generateSquares(List<Fixture> sublist) {
    // return sublist.map((e) => Text(e.score)).toList();
    return sublist.map((e) => MatchSmallCard(fixture: e)).toList();
  }
}
