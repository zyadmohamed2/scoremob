import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoremob/repo/main_repo/main_repo.dart';
import 'package:scoremob/view/page_fixtures/fixtures_view.dart';
import 'package:scoremob/view/res/strings.dart';
import 'package:scoremob/view/shared/widget/error_view.dart';
import 'package:scoremob/view/shared/widget/loading_view.dart';

import 'bloc/fixtures_bloc.dart';
import 'bloc/fixtures_events.dart';
import 'bloc/fixtures_state.dart';

class FixturesPage extends StatelessWidget {
  const FixturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          FixturesBloc(mainRepo: context.read<MainRepo>())
            ..add(const FixturesEventInit()),
      child: BlocBuilder<FixturesBloc, FixturesPageState>(
          builder: (context, state) {
        switch (state.state) {
          case FixturesPageStateEnum.Init:
            return Center(child: Text(resStrInit));
          case FixturesPageStateEnum.Loading:
            return AnimatedSwitcher(
                duration: Duration(milliseconds: 600),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: const LoadingView());
          case FixturesPageStateEnum.Error:
            return ErrorView(text: state.error);
          case FixturesPageStateEnum.Success:
            return AnimatedSwitcher(
                duration: Duration(milliseconds: 600),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: FixturesView(
                    fixtureDays: state.fixtureDays,
                    tabDays: state.getTabDays(),
                    selectedDay: state.selectedDay));
        }
      }),
    );
  }
}
