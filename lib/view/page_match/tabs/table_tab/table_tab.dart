import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoremob/view/page_match/bloc/match_bloc.dart';
import 'package:scoremob/view/page_match/bloc/match_state.dart';
import 'package:scoremob/view/page_match/tabs/table_tab/legend_card.dart';
import 'package:scoremob/view/page_match/tabs/table_tab/standing_card/standings_card.dart';
import 'package:scoremob/view/shared/widget/loading_view.dart';

class TableTab extends StatelessWidget {
  TableTab({required this.homeId, required this.awayId, super.key});
  int homeId;
  int awayId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchBloc, MatchPageState>(builder: (context, state) {
      switch (state.tableState) {
        case MatchPageTabsStateEnum.Loading:
          return const LoadingView();
        case MatchPageTabsStateEnum.Error:
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text(state.tableError ?? 'Unknown Error')),
          );
        case MatchPageTabsStateEnum.Success:
          {
            return Container(
              color: const Color(0xfff5f5f5),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  StandingsCard(
                    standingDetails: state.standingDetails,
                    homeId: homeId,
                    awayId: awayId,
                  ),
                  LegendCard(tiers: state.standingDetails.tiers)
                ],
              ),
            );
          }
      }
    });
  }
}
