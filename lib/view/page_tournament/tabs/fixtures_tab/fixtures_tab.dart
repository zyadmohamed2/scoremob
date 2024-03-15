import 'package:flutter/material.dart';
import 'package:scoremob/utils/date_utils.dart';
import 'package:scoremob/view/page_team/tabs/matches_tab/matches_card/matches_card.dart';

import '../../model/fixtures_by_day.dart';

class FixturesTab extends StatelessWidget {
  FixturesTab({required this.fixtures, super.key});

  FixturesByDay fixtures;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff5f5f5),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ...fixtures.dates
              .map((key, value) => MapEntry(
                  key,
                  MatchesCard(
                    title: key.getTodayOrFormatted(),
                    list: value,
                  )))
              .values
              .toList(),
        ],
      ),
    );
  }
}
