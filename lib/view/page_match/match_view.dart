import 'dart:async';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoremob/config.dart';
import 'package:scoremob/repo/main_repo/model/league_type.dart';
import 'package:scoremob/view/page_fixtures/model/fixture.dart';
import 'package:scoremob/view/page_match/bloc/match_bloc.dart';
import 'package:scoremob/view/page_match/bloc/match_events.dart';
import 'package:scoremob/view/page_match/model/fixture_details.dart';
import 'package:scoremob/view/page_match/tabs/fact_tab/fact_tab.dart';
import 'package:scoremob/view/page_match/tabs/h2h_tab/h2h_tab.dart';
import 'package:scoremob/view/page_match/tabs/knockout_tab/knockout_tab.dart';
import 'package:scoremob/view/page_match/tabs/lineup_tab/lineup_tab.dart';
import 'package:scoremob/view/page_match/tabs/stats_tab/stats_tab.dart';
import 'package:scoremob/view/page_match/tabs/table_tab/table_tab.dart';
import 'package:scoremob/view/page_match/widgets/score_view.dart';
import 'package:scoremob/view/page_match/widgets/score_view_mini.dart';
import 'package:scoremob/view/res/strings.dart';
import 'package:scoremob/view/theme/cards_config.dart';

class MatchView extends StatefulWidget {
  MatchView(
      {required this.fixtureDetails, required this.leagueType, super.key});

  FixtureDetails fixtureDetails;
  LeagueTypeEnum leagueType;

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  late Timer _timer;
  int _initialTab = 0;
  late final Map<String, Widget> _tabs;
  var collapsedHeight = 64.h;
  var expandedHeight = 240.h;
  final ScrollController _scrollController = ScrollController();
  double _appBarCollapsedPercentage = 100.0;
  int tabsCount = 0;

  @override
  void initState() {
    super.initState();
    _initialTabs();
    _setUpTabs();
    _setUpRefreshTimer();
    _sendPageLoadedEvent();
    _setUpScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: tabsCount,
        initialIndex: _initialTab,
        child: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                stretch: true,
                elevation: elevation,
                snap: false,
                leading: IconButton(
                    icon: Icon(FluentIcons.arrow_left_20_filled),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                expandedHeight: expandedHeight,
                title: AnimatedPadding(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.only(
                    bottom: _appBarCollapsedPercentage.h,
                  ),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: (1 - (_appBarCollapsedPercentage / 100)),
                    child: ScoreViewMini(fixtureDetails: widget.fixtureDetails),
                  ),
                ),
                collapsedHeight: collapsedHeight,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  stretchModes: const [
                    StretchMode.fadeTitle,
                  ],
                  collapseMode: CollapseMode.parallax,
                  background: ScoreView(fixtureDetails: widget.fixtureDetails),
                ),
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
                actions: [
                  IconButton(
                    icon: Icon(FluentIcons.star_16_regular),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(FluentIcons.more_vertical_16_filled),
                    onPressed: () {},
                  ),
                ],
                bottom: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  tabs: _generateTabs(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: _tabs.values.toList(),
          ),
        ),
      ),
    );
  }

  List<Tab> _generateTabs() {
    var temp = _tabs.keys
        .map(
          (e) {
            if (e == resStrFacts &&
                widget.fixtureDetails.status.firstTabShouldBePreview()) {
              return const Tab(
                child: Text(
                  resStrPreview,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }
            if (e == resStrLineup && !widget.fixtureDetails.lineUpAvailable()) {
              return null;
            }
            if (e == resStrStats && !widget.fixtureDetails.statsAvailable()) {
              return null;
            }
            return Tab(
              child: Text(
                e,
                style: const TextStyle(color: Colors.black),
              ),
            );
          },
        )
        .whereType<Tab>()
        .toList();

    tabsCount = temp.length;

    return temp;
  }

  void _setUpTabs() {
    _tabs[resStrFacts] = FactTab(fixtureDetails: widget.fixtureDetails);
    _tabs[resStrTable] = TableTab(
      homeId: widget.fixtureDetails.homeTeam.id,
      awayId: widget.fixtureDetails.awayTeam.id,
    );
    _tabs[resStrH2H] = H2hTab();
    if (widget.fixtureDetails.statsAvailable()) {
      _tabs[resStrStats] = StatsTab(fixtureDetails: widget.fixtureDetails);
    } else {
      _tabs.remove(resStrStats);
    }
    if (widget.fixtureDetails.lineUpAvailable()) {
      _tabs[resStrLineup] = LineupTab(fixtureDetails: widget.fixtureDetails);
    } else {
      _tabs.remove(resStrLineup);
    }
    if (widget.fixtureDetails.league.isInKnockoutStage()) {
      _tabs[resStrKnockout] = KnockoutTab();
    } else {
      _tabs.remove(resStrKnockout);
    }
  }

  void _initialTabs() {
    _tabs = {
      resStrFacts: const Center(child: Text(resStrFacts)),
      resStrLineup: const Center(child: Text(resStrLineup)),
      resStrTable: const Center(child: Text(resStrTable)),
      resStrStats: const Center(child: Text(resStrStats)),
      resStrKnockout: const Center(child: Text(resStrKnockout)),
      resStrH2H: const Center(child: Text(resStrH2H)),
    };
  }

  void _setUpRefreshTimer() {
    _timer = Timer.periodic(
        const Duration(seconds: FIXTURE_DETAILS_REFRESH_PERIOD), (_) {
      context.read<MatchBloc>().add(MatchEventRefresh());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _sendPageLoadedEvent() {
    context.read<MatchBloc>().add(MatchEventPageLoaded(
          widget.fixtureDetails.league.id,
          widget.fixtureDetails.league.season,
          widget.fixtureDetails.homeTeam.id,
          widget.fixtureDetails.awayTeam.id,
        ));
  }

  void _setUpScrollController() {
    _scrollController.addListener(() {
      setState(() {
        _appBarCollapsedPercentage = 100 -
            (_scrollController.offset / expandedHeight * 100).clamp(0.0, 100.0);
      });
    });
  }
}
