import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoremob/view/page_team/widgets/team_info.dart';
import 'package:scoremob/view/page_team/widgets/team_info_mini.dart';
import 'package:scoremob/view/res/strings.dart';

import '../page_match/tabs/table_tab/legend_card.dart';
import '../page_match/tabs/table_tab/standing_card/standings_card.dart';
import '../theme/cards_config.dart';
import 'bloc/team_bloc.dart';
import 'tabs/matches_tab/matches_tab.dart';
import 'tabs/overview_tab/overview_tab.dart';
import 'tabs/squad_tab/squad_tab.dart';
import 'tabs/transfers_tab/transfers_tab.dart';

class TeamView extends StatefulWidget {
  TeamView({required this.state, super.key});

  TeamPageState state;

  @override
  State<TeamView> createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {
  int _initialTab = 0;

  late final Map<String, Widget> _tabs;
  var collapsedHeight = 64.h;
  var expandedHeight = 152.h;
  final ScrollController _scrollController = ScrollController();
  double _appBarCollapsedPercentage = 100.0;

  @override
  void initState() {
    super.initState();
    _initialTabs();
    _setUpTabs();
    _setUpScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: _tabs.length,
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
                  duration: Duration(milliseconds: 200),
                  padding: EdgeInsets.only(
                    bottom: _appBarCollapsedPercentage.h,
                  ),
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 200),
                    opacity: (1 - (_appBarCollapsedPercentage / 100)),
                    child: TeamMiniInfoView(team: widget.state.teamInfo),
                  ),
                ),
                collapsedHeight: collapsedHeight,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  stretchModes: const [
                    StretchMode.fadeTitle,
                  ],
                  collapseMode: CollapseMode.parallax,
                  background: TeamInfoView(team: widget.state.teamInfo),
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

    return temp;
  }

  void _setUpTabs() {
    // _tabs[resStrFacts] = FactTab(fixtureDetails: widget.fixtureDetails);
  }

  void _initialTabs() {
    _tabs = {
      resStrOverview: OverviewTab(
        teamFixtures: widget.state.teamFixtures,
        teamInfo: widget.state.teamInfo,
        standingDetails: widget.state.standingDetails,
      ),
      resStrMatches: MatchesTab(
        teamFixtures: widget.state.teamFixtures,
      ),
      resStrTable: Container(
        color: Color(0xfff5f5f5),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            StandingsCard(
              standingDetails: widget.state.standingDetails,
              homeId: widget.state.teamInfo.id,
              awayId: widget.state.teamInfo.id,
            ),
            LegendCard(
              tiers: widget.state.standingDetails.tiers,
            )
          ],
        ),
      ),
      // resStrStats: const Center(child: Text("Stats")),
      resStrTransfers: TransfersTab(
          transfers: widget.state.transfers, teamId: widget.state.teamInfo.id),
      resStrSquad: SquadTab(
          players: widget.state.players, teamCoaches: widget.state.coaches),
    };
  }

  @override
  void dispose() {
    super.dispose();
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
