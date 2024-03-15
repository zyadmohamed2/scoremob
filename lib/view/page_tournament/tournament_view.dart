import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoremob/view/page_match/model/standing_details.dart';
import 'package:scoremob/view/page_tournament/tabs/fixtures_tab/fixtures_tab.dart';
import 'package:scoremob/view/page_tournament/widgets/tournament_info.dart';
import 'package:scoremob/view/page_tournament/widgets/tournament_info_mini.dart';

import '../page_match/tabs/table_tab/legend_card.dart';
import '../page_match/tabs/table_tab/standing_card/standings_card.dart';
import '../page_team/widgets/team_info_mini.dart';
import '../theme/cards_config.dart';
import 'bloc/tournament_state.dart';

class TournamentView extends StatefulWidget {
  TournamentView({required this.state, super.key});

  TournamentPageState state;

  @override
  State<TournamentView> createState() => _TournamentViewState();
}

class _TournamentViewState extends State<TournamentView> {
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
                    child: TournamentMiniInfoView(league: widget.state.league),
                  ),
                ),
                collapsedHeight: collapsedHeight,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  stretchModes: const [
                    StretchMode.fadeTitle,
                  ],
                  collapseMode: CollapseMode.parallax,
                  background: TournamentInfoView(
                    league: widget.state.league,
                  ),
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

  void _initialTabs() {
    _tabs = {
      'Table': Container(
        color: Color(0xfff5f5f5),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ..._generateStandingsCards(widget.state.standingDetails),
            LegendCard(
              tiers: widget.state.standingDetails.firstOrNull?.tiers ?? [],
            )
          ],
        ),
      ),
      'Fixtures': FixturesTab(fixtures: widget.state.fixtures),
      // 'Players stats': const Center(child: Text("Players Stats")),
      // 'Team stats': const Center(child: Text("Team Stats")),
      // 'Transfers': const Center(child: Text("Transfers")),
      // 'Seasons': const Center(child: Text("Seasons")),
    };
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

  List<Widget> _generateStandingsCards(List<StandingDetails> list) {
    var res = <Widget>[];

    for (var element in list) {
      res.add(
        StandingsCard(
          standingDetails: element,
        ),
      );
    }

    return res;
  }
}
