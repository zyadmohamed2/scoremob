import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/lineup.dart';
import 'package:scoremob/view/shared/widget/player_head.dart';
import 'package:scoremob/view/shared/widget/player_head_labeled.dart';
import 'package:scoremob/view/theme/cards_config.dart';

import '../../../../res/strings.dart';
import '../../../model/coach.dart';

class CoachesCard extends StatelessWidget {
  CoachesCard({required this.homeCoach, required this.awayCoach, super.key});

  Coach homeCoach;
  Coach awayCoach;

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
              Text(resStrCoach,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                  textAlign: TextAlign.start),
              Gap(12.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        PlayerHeadLabeled(
                          url: homeCoach.photo,
                          size: 46,
                        ),
                        Gap(4.h),
                        Text(homeCoach.name,
                            style: TextStyle(fontSize: 11.sp),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  Gap(8.w),
                  Expanded(
                    child: Column(
                      children: [
                        PlayerHead(
                          url: awayCoach.photo,
                          size: 46,
                        ),
                        Gap(4.h),
                        Text(awayCoach.name,
                            style: TextStyle(fontSize: 11.sp),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
