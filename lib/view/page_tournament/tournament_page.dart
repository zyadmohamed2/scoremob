import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoremob/view/page_tournament/tournament_view.dart';
import 'package:scoremob/view/res/strings.dart';

import '../../repo/main_repo/main_repo.dart';
import '../shared/widget/error_view.dart';
import '../shared/widget/loading_view.dart';
import 'bloc/tournament_bloc.dart';
import 'bloc/tournament_event.dart';
import 'bloc/tournament_state.dart';

class TournamentPage extends StatelessWidget {
  const TournamentPage({
    required this.tournamentId,
    required this.season,
    super.key,
  });

  final int tournamentId;
  final int season;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          TournamentBloc(mainRepo: context.read<MainRepo>())
            ..add(TournamentEventInit(tournamentId, season)),
      child: Scaffold(
        body: BlocBuilder<TournamentBloc, TournamentPageState>(
            builder: (context, state) {
          switch (state.state) {
            case TournamentPageStateEnum.Init:
              return Center(child: Text(resStrInit));
            case TournamentPageStateEnum.Loading:
              return const LoadingView();
            case TournamentPageStateEnum.Error:
              return ErrorView(text: state.error);
            case TournamentPageStateEnum.Success:
              return TournamentView(state: state);
            // return TeamView(fixtureDetails: state.fixtureDetails);
          }
        }),
      ),
    );
  }
}
