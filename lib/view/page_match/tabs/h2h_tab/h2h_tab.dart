import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/bloc/match_bloc.dart';
import 'package:scoremob/view/page_match/bloc/match_state.dart';
import 'package:scoremob/view/page_match/tabs/h2h_tab/h2h_history_card/h2h_history_card.dart';
import 'package:scoremob/view/page_match/tabs/h2h_tab/h2h_meter_card/h2h_meter_card.dart';
import 'package:scoremob/view/page_match/tabs/h2h_tab/season_so_far_card/season_so_far_card.dart';
import 'package:scoremob/view/shared/widget/loading_view.dart';

class H2hTab extends StatelessWidget {
  const H2hTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchBloc, MatchPageState>(builder: (context, state) {
      switch (state.h2hState) {
        case MatchPageTabsStateEnum.Loading:
          return LoadingView();
        case MatchPageTabsStateEnum.Error:
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text(state.h2hError ?? 'Unknown Error')),
          );
        case MatchPageTabsStateEnum.Success:
          {
            return Container(
              color: Color(0xfff5f5f5),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  H2hMeterCard(
                    h2hDetails: state.h2hDetails,
                    homeLogo: state.fixtureDetails.homeTeam.logo,
                    awayLogo: state.fixtureDetails.awayTeam.logo,
                  ),
                  (state.h2hDetails.fixtures.isEmpty)
                      ? Gap(0)
                      : H2hHistoryCard(h2hDetails: state.h2hDetails),
                  SeasonSoFarCard(
                    standingDetails: state.standingDetails,
                    homeTeam: state.fixtureDetails.homeTeam,
                    awayTeam: state.fixtureDetails.awayTeam,
                  ),
                ],
              ),
            );
          }
      }
    });
  }
}
