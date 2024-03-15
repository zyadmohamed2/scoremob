import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/tabs/fact_tab/man_of_match_card/rating_text.dart';
import 'package:scoremob/view/res/strings.dart';
import 'package:scoremob/view/shared/widget/club_logo.dart';
import 'package:scoremob/view/shared/widget/player_head.dart';
import 'package:scoremob/view/shared/widget/player_head_labeled.dart';
import 'package:scoremob/view/theme/cards_config.dart';

import '../../../model/player.dart';

class ManOfMatchCard extends StatelessWidget {
  ManOfMatchCard({required this.playerOfMatch, super.key});

  PlayerStats? playerOfMatch;

  @override
  Widget build(BuildContext context) {
    if (playerOfMatch == null) {
      return Gap(0);
    }
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
              Text(resStrPlayerOfMatch,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                  textAlign: TextAlign.start),
              Gap(14.h),
              Row(
                children: [
                  Gap(6.w),
                  PlayerHeadLabeled(
                    url: playerOfMatch?.getPhoto() ?? '',
                    size: 42,
                    rating: playerOfMatch?.getRatingDouble() ?? 0,
                    isPOTM: true,
                  ),
                  Gap(14.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        playerOfMatch?.getName() ?? '',
                        style: TextStyle(color: Colors.black, fontSize: 12.sp),
                      ),
                      Row(
                        children: [
                          ClubLogo(
                            url: playerOfMatch?.team.logo ?? '',
                            size: 14,
                          ),
                          Gap(6.w),
                          Text(
                            playerOfMatch?.team?.name ?? '',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 10.sp),
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
