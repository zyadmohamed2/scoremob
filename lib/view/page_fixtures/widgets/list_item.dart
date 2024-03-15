import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/shared/widget/club_logo.dart';

import '../../page_match/match_page.dart';
import '../model/fixture.dart';

class FixtureListItem extends StatelessWidget {
  Fixture fixtureData;

  FixtureListItem({required this.fixtureData, super.key});

  @override
  Widget build(BuildContext context) {
    var teamTextStyle = TextStyle(
        fontWeight: FontWeight.w400, fontSize: 10.sp, color: Color(0xff000000));
    var decoration = fixtureData.status.isPostponedOrCancelled()
        ? TextDecoration.lineThrough
        : TextDecoration.none;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MatchPage(fixtureId: fixtureData.id)),
        );
      },
      child: Ink(
        child: Container(
          // height: 64.h,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: fixtureData.status.shouldShowStateInFixtureItem(),
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: FixtureStateIcon(fixtureData: fixtureData)),
              Gap(4.w),
              Expanded(
                child: Text(
                  fixtureData.homeTeam.name,
                  style: teamTextStyle,
                  textAlign: TextAlign.end,
                ),
              ),
              Gap(8.w),
              ClubLogo(
                url: fixtureData.homeTeam.logo,
                size: 22,
              ),
              Gap(9.w),
              Text(fixtureData.getScoreOrTime(),
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10.sp,
                      decoration: decoration,
                      color: Color(0xff000000))),
              Gap(9.w),
              ClubLogo(
                url: fixtureData.awayTeam.logo,
                size: 22,
              ),
              Gap(8.w),
              Expanded(
                  child: Text(fixtureData.awayTeam.name, style: teamTextStyle)),
              Gap(4.w),
              Visibility(
                visible: false,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: FixtureStateIcon(fixtureData: fixtureData),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FixtureStateIcon extends StatelessWidget {
  const FixtureStateIcon({required this.fixtureData, super.key});

  final Fixture fixtureData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.w,
      width: 24.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: fixtureData.status.getStateTextBack(),
      ),
      child: Center(
        child: Text(
          fixtureData.status.getSmallState(),
          style: TextStyle(
            fontSize: 9.sp,
            fontWeight: FontWeight.w700,
            color: fixtureData.status.getStateTextColor(),
          ),
        ),
      ),
    );
  }
}
