import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/standings_tier.dart';
import 'package:scoremob/view/shared/widget/tournament_logo.dart';
import 'package:scoremob/view/theme/cards_config.dart';

import '../../../../page_match/model/standing.dart';
import '../../../../page_match/model/standing_details.dart';
import '../../../../page_match/tabs/table_tab/standing_card/standing_list_item.dart';
import '../../../../page_match/tabs/table_tab/standing_card/standings_header.dart';

class MiniStandingCard extends StatelessWidget {
  MiniStandingCard({required this.standings, required this.teamId, super.key});

  StandingDetails? standings;
  int teamId;

  @override
  Widget build(BuildContext context) {
    if (standings == null) {
      return const Gap(0);
    }
    var list = _getSublist(standings?.standings ?? [], teamId);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TournamentLogo(url: standings?.league?.logo ?? '', size: 20),
                  Gap(14.w),
                  Text(standings?.league.name ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 12.sp),
                      textAlign: TextAlign.start),
                ],
              ),
              Gap(12.h),
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: list.length + 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return StandingsHeader();
                  } else {
                    return StandingListItem(
                        season: standings?.league.season ?? 0,
                        leagueId: standings?.league.id ?? 0,
                        tiers: standings?.tiers ?? [],
                        standing: list[index - 1],
                        isHighlighted: teamId == list[index - 1].team.id);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Standing> _getSublist(List<Standing> teams, int targetTeam) {
    int index = teams.indexWhere(
      (element) {
        return element.team.id == targetTeam;
      },
    );

    if (index == -1) {
      return [];
    }

    int startIndex = index > 0 ? index - 1 : 0;
    int endIndex = index < teams.length - 1 ? index + 2 : index + 1;

    return teams.sublist(startIndex, endIndex);
  }
}
