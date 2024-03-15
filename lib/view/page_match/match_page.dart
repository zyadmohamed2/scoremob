import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoremob/repo/main_repo/main_repo.dart';
import 'package:scoremob/view/page_match/bloc/match_bloc.dart';
import 'package:scoremob/view/page_match/bloc/match_events.dart';
import 'package:scoremob/view/page_match/bloc/match_state.dart';
import 'package:scoremob/view/page_match/match_view.dart';
import 'package:scoremob/view/shared/widget/error_view.dart';

import '../res/strings.dart';
import '../shared/widget/loading_view.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({required this.fixtureId, super.key});
  final int fixtureId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          MatchBloc(mainRepo: context.read<MainRepo>())
            ..add(MatchEventInit(fixtureId)),
      child: Scaffold(
        body: BlocBuilder<MatchBloc, MatchPageState>(builder: (context, state) {
          switch (state.state) {
            case MatchPageStateEnum.Init:
              return const Center(child: Text(resStrInit));
            case MatchPageStateEnum.Loading:
              return const LoadingView();
            case MatchPageStateEnum.Error:
              return ErrorView(text: state.error);
            case MatchPageStateEnum.Success:
              return MatchView(
                  fixtureDetails: state.fixtureDetails,
                  leagueType: state.leagueType);
          }
        }),
      ),
    );
  }
}
