import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../res/strings.dart';

class H2hHistoryItemShowMore extends StatelessWidget {
  const H2hHistoryItemShowMore({required this.action, super.key});

  final void Function() action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          Expanded(child: Gap(1.w)),
          GestureDetector(
            onTap: action,
            child: const Text(
              resStrViewAll,
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.green),
            ),
          ),
          Gap(24.w)
        ],
      ),
    );
  }
}
