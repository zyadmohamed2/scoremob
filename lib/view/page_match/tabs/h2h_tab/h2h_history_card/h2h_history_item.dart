import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/shared/widget/club_logo.dart';

import '../../../../page_fixtures/model/fixture.dart';
import '../../../match_page.dart';

class H2hHistoryItem extends StatelessWidget {
  H2hHistoryItem({required this.fixture, super.key});

  Fixture fixture;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MatchPage(fixtureId: fixture.id)),
        );
      },
      child: Column(
        children: [
          Gap(10.h),
          Row(
            children: [
              Text(
                fixture.status.getFullDate(),
                style: TextStyle(
                  color: const Color(0xffa9a9a9),
                  fontSize: 8.sp,
                ),
              ),
              Expanded(child: Gap(1.w)),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  color: Color(0xfff5f5f5),
                ),
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                child: Text(
                  fixture.league.name.toUpperCase(),
                  style: TextStyle(
                    color: const Color(0xffa9a9a9),
                    fontSize: 8.sp,
                  ),
                ),
              ),
            ],
          ),
          Gap(14.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Text(
                fixture.homeTeam.name,
                textAlign: TextAlign.end,
              )),
              Gap(8.w),
              ClubLogo(
                url: fixture.homeTeam.logo,
                size: 22,
              ),
              Gap(14.w),
              Text(fixture.score),
              Gap(14.w),
              ClubLogo(
                url: fixture.awayTeam.logo,
                size: 22,
              ),
              Gap(8.w),
              Expanded(child: Text(fixture.awayTeam.name)),
            ],
          ),
          Gap(16.h),
          Divider(
            height: 1.h,
          )
        ],
      ),
    );
  }
}
