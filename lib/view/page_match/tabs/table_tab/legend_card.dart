import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/config.dart';

import '../../../res/strings.dart';
import '../../model/standings_tier.dart';

class LegendCard extends StatelessWidget {
  LegendCard({required this.tiers, super.key});

  List<StandingTier> tiers;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _generateItems(tiers),
      ),
    );
  }

  List<Widget> _generateItems(List<StandingTier> tiers) {
    tiers.sort(
      (a, b) => a.rank - b.rank,
    );
    var res = <Widget>[];
    for (var value in tiers) {
      res.add(LegendItem(text: value.name, color: value.color));
    }

    return res;
  }
}

class LegendItem extends StatelessWidget {
  LegendItem({required this.text, required this.color, super.key});

  Color color;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          Gap(10.w),
          Expanded(
              child: Text(
            text,
            style: TextStyle(fontSize: 8.sp),
          ))
        ],
      ),
    );
  }
}
