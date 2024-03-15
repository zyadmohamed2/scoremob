import 'package:auto_size_text/auto_size_text.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/fixture_details.dart';
import 'package:scoremob/view/page_team/team_page.dart';
import 'package:scoremob/view/shared/widget/club_logo.dart';

class ScoreView extends StatelessWidget {
  ScoreView({required this.fixtureDetails, super.key});

  FixtureDetails fixtureDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50.h, left: 8.w, right: 8.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Gap(16.w),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TeamPage(
                                teamId: fixtureDetails.homeTeam.id,
                                season: fixtureDetails.league.season,
                                leagueId: fixtureDetails.league.id,
                              )),
                    );
                  },
                  child: Column(
                    children: [
                      ClubLogo(url: fixtureDetails.homeTeam.logo, size: 48),
                      Gap(10.h),
                      AutoSizeText(
                        fixtureDetails.homeTeam.name,
                        style: TextStyle(fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        wrapWords: false,
                        minFontSize: 6,
                      ),

                      // Text(fixtureDetails.homeTeam.name,
                      //     style: TextStyle(fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      fixtureDetails.getScoreOrTime(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Gap(20.h),
                    Text(fixtureDetails.status.statusLongOrTime())
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TeamPage(
                                teamId: fixtureDetails.awayTeam.id,
                                season: fixtureDetails.league.season,
                                leagueId: fixtureDetails.league.id,
                              )),
                    );
                  },
                  child: Column(
                    children: [
                      ClubLogo(url: fixtureDetails.awayTeam.logo, size: 48),
                      Gap(10.h),
                      AutoSizeText(
                        fixtureDetails.awayTeam.name,
                        style: TextStyle(fontWeight: FontWeight.w600),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        wrapWords: false,
                        minFontSize: 6,
                      ),
                      // Text(fixtureDetails.awayTeam.name,
                      //     style: TextStyle(fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
              ),
              Gap(16.w),
            ],
          ),
          Gap(12.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: AutoSizeText(
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  wrapWords: false,
                  fixtureDetails.getHomeScorersFormatted(),
                  textAlign: TextAlign.end,
                  minFontSize: 6,
                  maxLines: 4,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 9.sp,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              Gap(12.w),
              Icon(
                FluentIcons.sport_soccer_16_regular,
                size: 12.h,
              ),
              Gap(12.w),
              Expanded(
                child: AutoSizeText(
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  wrapWords: false,
                  fixtureDetails.getAwayScorersFormatted(),
                  textAlign: TextAlign.start,
                  minFontSize: 6,
                  maxLines: 4,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 9.sp,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
