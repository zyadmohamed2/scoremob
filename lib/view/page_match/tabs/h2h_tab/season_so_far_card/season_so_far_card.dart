import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/utils/int_utils.dart';
import 'package:scoremob/view/page_match/model/standing_details.dart';
import 'package:scoremob/view/page_match/tabs/h2h_tab/h2h_meter_card/stat_header_logo.dart';
import 'package:scoremob/view/page_match/tabs/stats_tab/top_stats_card/stat_bar.dart';
import 'package:scoremob/view/shared/model/team.dart';
import 'package:scoremob/view/shared/widget/tournament_logo.dart';

import '../../../../res/strings.dart';

class SeasonSoFarCard extends StatelessWidget {
  SeasonSoFarCard(
      {required this.standingDetails,
      required this.homeTeam,
      required this.awayTeam,
      super.key});

  StandingDetails standingDetails;
  Team homeTeam;
  Team awayTeam;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 16.h, bottom: 12.h, right: 14.w, left: 14.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StatHeaderLogo(
                  title: resStrSeasonSoFar,
                  homeLogo: homeTeam.logo,
                  awayLogo: awayTeam.logo),
              Gap(12.h),
              Divider(
                height: 1.h,
              ),
              Gap(14.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TournamentLogo(url: standingDetails.league.logo),
                  Gap(6.w),
                  Text(standingDetails.league.name)
                ],
              ),
              Gap(14.h),
              Divider(
                height: 1.h,
              ),
              Gap(14.h),
              StatBar(
                  title: resStrTablePosition,
                  homeValue: standingDetails
                      .getStandingTeam(homeTeam.id)
                      .rank
                      .addOrdinal(),
                  awayValue: standingDetails
                      .getStandingTeam(awayTeam.id)
                      .rank
                      .addOrdinal(),
                  higherValueIsHome:
                      (standingDetails.getStandingTeam(homeTeam.id).rank <
                          standingDetails.getStandingTeam(awayTeam.id).rank)),
              Gap(14.h),
              StatBar(
                  title: resStrWon,
                  homeValue: standingDetails
                      .getStandingTeam(homeTeam.id)
                      .allGamesStats
                      .won
                      .toString(),
                  awayValue: standingDetails
                      .getStandingTeam(awayTeam.id)
                      .allGamesStats
                      .won
                      .toString(),
                  higherValueIsHome: (standingDetails
                          .getStandingTeam(homeTeam.id)
                          .allGamesStats
                          .won >
                      standingDetails
                          .getStandingTeam(awayTeam.id)
                          .allGamesStats
                          .won)),
              Gap(14.h),
              StatBar(
                  title: resStrDrawn,
                  homeValue: standingDetails
                      .getStandingTeam(homeTeam.id)
                      .allGamesStats
                      .draw
                      .toString(),
                  awayValue: standingDetails
                      .getStandingTeam(awayTeam.id)
                      .allGamesStats
                      .draw
                      .toString(),
                  higherValueIsHome: (standingDetails
                          .getStandingTeam(homeTeam.id)
                          .allGamesStats
                          .draw >
                      standingDetails
                          .getStandingTeam(awayTeam.id)
                          .allGamesStats
                          .draw)),
              Gap(14.h),
              StatBar(
                  title: resStrLost,
                  homeValue: standingDetails
                      .getStandingTeam(homeTeam.id)
                      .allGamesStats
                      .lose
                      .toString(),
                  awayValue: standingDetails
                      .getStandingTeam(awayTeam.id)
                      .allGamesStats
                      .lose
                      .toString(),
                  higherValueIsHome: (standingDetails
                          .getStandingTeam(homeTeam.id)
                          .allGamesStats
                          .lose <
                      standingDetails
                          .getStandingTeam(awayTeam.id)
                          .allGamesStats
                          .lose)),
              Gap(14.h),
              StatBar(
                  title: resStrGoalsPerMatch,
                  homeValue: standingDetails
                      .getStandingTeam(homeTeam.id)
                      .getGoalsPerMatch()
                      .toString(),
                  awayValue: standingDetails
                      .getStandingTeam(awayTeam.id)
                      .getGoalsPerMatch()
                      .toString(),
                  higherValueIsHome: (standingDetails
                          .getStandingTeam(homeTeam.id)
                          .getGoalsPerMatch() >
                      standingDetails
                          .getStandingTeam(awayTeam.id)
                          .getGoalsPerMatch())),
              Gap(14.h),
              StatBar(
                  title: resStrGoalsConcededPerMatch,
                  homeValue: standingDetails
                      .getStandingTeam(homeTeam.id)
                      .getGoalsConcededPerMatch()
                      .toString(),
                  awayValue: standingDetails
                      .getStandingTeam(awayTeam.id)
                      .getGoalsConcededPerMatch()
                      .toString(),
                  higherValueIsHome: (standingDetails
                          .getStandingTeam(homeTeam.id)
                          .getGoalsConcededPerMatch() <
                      standingDetails
                          .getStandingTeam(awayTeam.id)
                          .getGoalsConcededPerMatch())),
              Gap(14.h),
            ],
          ),
        ),
      ),
    );
  }
}
