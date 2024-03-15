import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoremob/view/page_match/model/standing_details.dart';
import 'package:scoremob/view/page_match/tabs/table_tab/standing_card/standing_list_item.dart';
import 'package:scoremob/view/page_match/tabs/table_tab/standing_card/standings_header.dart';
import 'package:scoremob/view/theme/cards_config.dart';

class StandingsCard extends StatelessWidget {
  StandingsCard(
      {this.homeId, this.awayId, required this.standingDetails, super.key});

  StandingDetails standingDetails;
  int? homeId;
  int? awayId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vPad.h, horizontal: hPad.w),
      child: Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(corners),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 0.h, bottom: 0.h, right: 0.w, left: 0.w),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: standingDetails.standings.length + 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index == 0) {
                return StandingsHeader();
              } else {
                return StandingListItem(
                  leagueId: standingDetails.league.id,
                  season: standingDetails.league.season,
                  standing: standingDetails.standings[index - 1],
                  tiers: standingDetails.tiers,
                  isHighlighted: _isHighlighted(
                      standingDetails.standings[index - 1].team.id),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  bool _isHighlighted(int id) {
    return (id == homeId || id == awayId);
  }
}
