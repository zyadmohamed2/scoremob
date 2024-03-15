import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/shared/widget/club_logo.dart';
import 'package:scoremob/view/shared/widget/player_head.dart';
import 'package:scoremob/view/shared/widget/player_head_labeled.dart';

import '../../../../res/strings.dart';
import '../../../../theme/cards_config.dart';
import '../../../model/transfer.dart';

class TransferCard extends StatelessWidget {
  TransferCard({required this.transfer, required this.teamId, super.key});

  Transfer transfer;
  int teamId;

  @override
  Widget build(BuildContext context) {
    bool isIn = false;
    if (teamId == transfer.outTeam.id) {
      isIn = true;
    }
    var otherteam = isIn ? transfer.inTeam : transfer.outTeam;

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //face
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: Gap(0)),
                  Expanded(
                      child: PlayerHeadLabeled(
                          url: transfer.getPlayerPhoto(), size: 52)),
                  Expanded(
                    child: Text(
                      transfer.date,
                      textAlign: TextAlign.end,
                      style:
                          TextStyle(fontSize: 8.sp, color: Color(0xff969696)),
                    ),
                  )
                ],
              ),
              Gap(12.h),
              //name
              Text(
                transfer.playerName,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
              ),
              Gap(12.h),

              //from
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Text(
                    (isIn ? resStrFrom : resStrTo),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff969696)),
                  )),
                  Gap(12.w),
                  ClubLogo(
                    url: otherteam.logo,
                    size: 22,
                  ),
                  Gap(12.w),
                  Expanded(
                      child: Text(
                    otherteam.name,
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w700),
                  ))
                ],
              ),
              Gap(12.h),

              Text(transfer.type),
            ],
          ),
        ),
      ),
    );
  }
}
