import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/tabs/h2h_tab/h2h_meter_card/win_stat_element.dart';

class H2hWinsStat extends StatelessWidget {
  H2hWinsStat(
      {required this.homeWins,
      required this.awayWins,
      required this.draws,
      super.key});

  int homeWins;
  int awayWins;
  int draws;

  final Color homeColor = const Color(0xff143c74);
  final Color awayColor = const Color(0xffaa2a31);
  final Color drawColor = const Color(0xfff2f2f2);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WinStatElement(
            title: 'Wins',
            color: homeColor,
            percentage: _calculatePercentage(homeWins),
            wins: homeWins),
        Expanded(child: Gap(1.w)),
        WinStatElement(
          title: 'Draws',
          color: drawColor,
          percentage: _calculatePercentage(draws),
          wins: draws,
          textColor: Colors.black,
        ),
        Expanded(child: Gap(1.w)),
        WinStatElement(
            title: 'Wins',
            color: awayColor,
            percentage: _calculatePercentage(awayWins),
            wins: awayWins),
      ],
    );
  }

  int _calculatePercentage(int value) {
    var sum = homeWins + draws + awayWins;
    sum = (sum == 0) ? 1 : sum;
    return ((value / sum) * 100).toInt();
  }
}
