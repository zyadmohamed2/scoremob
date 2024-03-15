import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/res/assets_res.dart';

import '../../res/strings.dart';

class FixtureListEmptyView extends StatelessWidget {
  const FixtureListEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff5f5f5),
      padding: EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AssetsRes.PLAYER, width: 128.w),
            Gap(16.h),
            Text(resStrNoFixtures),
          ],
        ),
      ),
    );
  }
}
