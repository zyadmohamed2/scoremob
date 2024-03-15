import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/fixture_details.dart';
import 'package:scoremob/view/page_match/model/lineup.dart';
import 'package:scoremob/view/page_match/tabs/lineup_tab/lineup_card/lineup_player_item.dart';

class LineupCard extends StatelessWidget {
  LineupCard({required this.fixtureDetails, super.key});

  FixtureDetails fixtureDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffebebeb),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Padding(
          //       padding: EdgeInsets.symmetric(vertical: 14.h),
          //       child: Image.asset(
          //         AssetsRes.LINEUP,
          //         width: 16.w,
          //         height: 16.h,
          //       ),
          //     ),
          //     Gap(10.w),
          //     Text('Lineup')
          //   ],
          // ),
          Container(
            color: Color(0xff1b9e6d),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    child: Text(
                      fixtureDetails.homeTeam.name,
                      style: TextStyle(color: Colors.white),
                    )),
                Gap(8.w),
                Text(
                  fixtureDetails.homeLineup.formation,
                  style: TextStyle(color: Color(0xffb9decd)),
                )
              ],
            ),
          ),
          _lineupStadium(fixtureDetails.homeLineup),
          Divider(height: 1),
          RotatedBox(
              quarterTurns: 2,
              child: _lineupStadium(fixtureDetails.awayLineup, rotated: true)),
          Container(
            color: Color(0xff1b9e6d),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    child: Text(
                      fixtureDetails.awayTeam.name,
                      style: TextStyle(color: Colors.white),
                    )),
                Gap(8.w),
                Text(
                  fixtureDetails.awayLineup.formation,
                  style: TextStyle(color: Color(0xffb9decd)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _lineupStadium(Lineup lineup, {bool rotated = false}) {
    var rowCount = lineup.getVLines() + 1;
    var columnCount = lineup.getHLines();
    var rowSpacing = 4.w;
    var rowPadding = 8.w;

    List<Widget> rows = [];
    for (int row = 0; row < rowCount; row++) {
      List<Widget> cells = [Gap(rowPadding), Gap(rowSpacing)];
      lineup.startXI
          .where((element) => element.getVLine() == row)
          .forEach((element) {
        cells.add(
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: RotatedBox(
                    quarterTurns: rotated ? 2 : 0,
                    child: LineupPlayerItem(
                      photo: fixtureDetails.playerPhotos[element.id],
                      player: element,
                      stats: fixtureDetails.getStatForPlayer(element.id),
                      isPOTM: fixtureDetails.getPlayerOfMatch()?.getID() ==
                          element.id,
                      teamColors: lineup.colors,
                      isSubIn: fixtureDetails.subsInIds.contains(element.id),
                      isSubOut: fixtureDetails.subsOutIds.contains(element.id),
                    )),
              ),
            ),
          ),
        );
        cells.add(Gap(rowSpacing));
        cells.add(Gap(rowPadding));
      });
      rows.add(Row(
        crossAxisAlignment:
            rotated ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: cells,
      ));
    }

    return Container(
      color: Color(0xff409060),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.1,
            image: AssetImage("assets/backgrounds/football_field.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: rows,
        ),
      ),
    );
  }
}
