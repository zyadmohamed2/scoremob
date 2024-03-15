import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../res/strings.dart';

class StandingsHeader extends StatelessWidget {
  const StandingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade50, width: 1.h),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 18.h),
      child: Row(
        children: [
          Gap(14.w),
          Text(resStrDiaz),
          Gap(14.w),
          Expanded(child: Text(' ')),
          Text(resStrPL),
          Gap(18.w),
          Text(resStrGD),
          Gap(18.w),
          Text(resStrPTS),
          Gap(12.w),
        ],
      ),
    );
  }
}
