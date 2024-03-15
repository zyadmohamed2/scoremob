import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoremob/view/page_match/model/league.dart';
import 'package:scoremob/view/theme/cards_config.dart';

import '../model/fixture.dart';
import '../model/league_fixture.dart';
import 'list_header.dart';
import 'list_item.dart';

class LeagueFixtureView extends StatelessWidget {
  var opened = false;

  LeagueFixtureView({required this.fixtures, super.key});

  LeagueFixtures fixtures;

  @override
  Widget build(BuildContext context) {
    var shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(corners),
      side: const BorderSide(color: Color(0xffe9e9e9), width: 1),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad.w, vertical: vPad.h),
      child: ExpansionTile(
        collapsedIconColor: Colors.grey,
        iconColor: Colors.grey,
        initiallyExpanded: true,
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        collapsedShape: shape,
        shape: shape,
        title: FixtureListHeader(
            league: fixtures.fixtures?.firstOrNull?.league ?? League.empty()),
        children: [
          Divider(color: Color(0xffe9e9e9), height: 4.h),
          ..._genFixtures(fixtures.fixtures),
        ],
      ),
    );
  }

  List<Widget> _genFixtures(List<Fixture> fixtures) {
    fixtures.sort(
      (a, b) {
        return ((a.status.startDateTime?.millisecondsSinceEpoch ?? 0) -
            (b.status.startDateTime?.millisecondsSinceEpoch ?? 0));
      },
    );
    return fixtures.map((e) => FixtureListItem(fixtureData: e)).toList();
  }
}
