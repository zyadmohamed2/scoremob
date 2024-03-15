import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoremob/repo/main_repo/main_repo.dart';
import 'package:scoremob/view/page_team/team_view.dart';
import 'package:scoremob/view/res/strings.dart';
import 'package:scoremob/view/shared/widget/error_view.dart';
import 'package:scoremob/view/shared/widget/loading_view.dart';

import 'bloc/team_bloc.dart';

class TeamPage extends StatelessWidget {
  const TeamPage(
      {required this.teamId,
      super.key,
      required this.leagueId,
      required this.season});

  final int teamId;
  final int leagueId;
  final int season;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          TeamBloc(mainRepo: context.read<MainRepo>())
            ..add(TeamEventInit(teamId, season, leagueId)),
      child: Scaffold(
        body: BlocBuilder<TeamBloc, TeamPageState>(builder: (context, state) {
          switch (state.state) {
            case TeamPageStateEnum.Init:
              return Center(child: Text(resStrInit));
            case TeamPageStateEnum.Loading:
              return const LoadingView();
            case TeamPageStateEnum.Error:
              return ErrorView(text: state.error);
            case TeamPageStateEnum.Success:
              return TeamView(state: state);
            // return TeamView(fixtureDetails: state.fixtureDetails);
          }
        }),
      ),
    );
  }
}
