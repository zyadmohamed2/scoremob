import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../bloc/fixtures_bloc.dart';
import '../bloc/fixtures_events.dart';
import '../model/fixture_day.dart';
import '../model/league_fixture.dart';
import 'league_fixture_view.dart';
import 'list_empty_view.dart';

class FixtureListView extends StatelessWidget {
  FixtureListView({this.fixtureDay, super.key});

  FixtureDay? fixtureDay;

  @override
  Widget build(BuildContext context) {
    if (fixtureDay == null) {
      return FixtureListEmptyView();
    } else {
      return Container(
        color: Color(0xfff5f5f5),
        child: LiquidPullToRefresh(
          height: 60.h,
          springAnimationDurationInMilliseconds: 800,
          showChildOpacityTransition: false,
          backgroundColor: Color(0xff439664),
          color: Color(0xfff5f5f5),
          animSpeedFactor: 2,
          onRefresh: () async {
            context.read<FixturesBloc>().add(FixturesEventRefresh());
          },
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: _allLeagues(fixtureDay),
          ),
        ),
      );
    }
  }

  List<Widget> _allLeagues(FixtureDay? fixtureDay) {
    return fixtureDay?.leagueFixtures.values
            .whereType<LeagueFixtures>()
            .map((e) => LeagueFixtureView(fixtures: e))
            .toList() ??
        [];
  }
}
