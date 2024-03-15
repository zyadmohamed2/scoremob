import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/shared/widget/player_head.dart';
import 'package:scoremob/view/shared/widget/player_head_labeled.dart';

import '../../../../theme/cards_config.dart';
import '../../../model/coach_info.dart';
import '../../../model/player_data.dart';

class PlayersCard extends StatelessWidget {
  PlayersCard(
      {required this.title, required this.players, this.coach, super.key});

  String title;
  List<PlayerData> players;
  CoachInfo? coach;

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.sp),
                textAlign: TextAlign.start),
            Gap(20.w),
            ...players.map((e) => _playerItem(e)).toList(),
            _coachItem(coach),
          ]),
        ),
      ),
    );
  }

  Widget _coachItem(CoachInfo? data) {
    if (data == null) {
      return const Gap(0);
    }
    return _item(data.photo, data.name, data.nationality);
  }

  Widget _playerItem(PlayerData data) {
    return _item(data.photo, data.name, data.nationality,
        injured: data.injured);
  }

  Widget _item(String photo, String name, String nationality,
      {bool injured = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PlayerHeadLabeled(
            url: photo,
            size: 36,
            injured: injured,
          ),
          Gap(14.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style:
                      TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
                  textAlign: TextAlign.start),
              // Gap(8.h),
              Text(nationality,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: Colors.grey),
                  textAlign: TextAlign.start),
            ],
          )
        ],
      ),
    );
  }
}
