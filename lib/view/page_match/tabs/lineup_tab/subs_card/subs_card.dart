import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/lineup.dart';
import 'package:scoremob/view/page_match/tabs/lineup_tab/subs_card/lineup_head.dart';
import 'package:scoremob/view/theme/cards_config.dart';

import '../../../model/fixture_details.dart';
import '../../../model/lineup_player.dart';

class SubsCard extends StatelessWidget {
  SubsCard({required this.fixtureDetails, super.key});

  FixtureDetails fixtureDetails;

  // List<LineupPlayer> homeSubs;
  // List<LineupPlayer> awaySubs;
  // Map<int, String> photos;

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
              EdgeInsets.only(top: 16.h, bottom: 14.h, right: 14.w, left: 14.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Bench',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                  textAlign: TextAlign.start),
              Gap(12.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                        children: _generateSubsList(
                            fixtureDetails.homeLineup.substitutes)),
                  ),
                  Gap(8.w),
                  Expanded(
                    child: Column(
                        children: _generateSubsList(
                            fixtureDetails.awayLineup.substitutes)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _generateSubsList(List<LineupPlayer> subs) {
    List<Widget> res = [];
    for (var element in subs) {
      res.add(LineupHead(
        player: element,
        photo: fixtureDetails.playerPhotos[element.id] ?? '',
        rating: fixtureDetails.getStatForPlayer(element.id)?.getRatingDouble(),
        subsIn: fixtureDetails.subsInIds.contains(element.id),
      ));
    }

    return res;
  }
}
