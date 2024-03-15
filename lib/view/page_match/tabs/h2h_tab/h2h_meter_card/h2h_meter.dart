import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class H2hMeter extends StatelessWidget {
  H2hMeter(
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
    var size = 4.h;
    return Row(
      children: [
        Expanded(
            flex: homeWins,
            child: Container(
              height: size,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  bottomLeft: Radius.circular(18.0),
                ),
                color: homeColor,
              ),
            )),
        Expanded(
            flex: draws,
            child: Container(
              height: size,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(0.0),
                  bottomRight: Radius.circular(0.0),
                ),
                color: drawColor,
              ),
            )),
        Expanded(
            flex: awayWins,
            child: Container(
              height: size,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(18.0),
                  bottomRight: Radius.circular(18.0),
                ),
                color: awayColor,
              ),
            )),
      ],
    );
  }
}
