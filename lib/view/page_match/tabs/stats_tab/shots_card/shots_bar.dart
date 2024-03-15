import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../res/strings.dart';

class ShotsBar extends StatelessWidget {
  ShotsBar(
      {required this.homeOffTarget,
      required this.homeOnTarget,
      required this.awayOffTarget,
      required this.awayOnTarget,
      super.key});

  int homeOffTarget;
  int homeOnTarget;
  int awayOffTarget;
  int awayOnTarget;

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(
        color: Colors.black, fontWeight: FontWeight.w700, fontSize: 10.sp);

    return Container(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        top: 6.h,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
        color: Colors.grey.shade300,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                homeOffTarget.toString(),
                style: style,
              ),
              Expanded(
                  child: Text(
                resStrShotsOffTarget,
                textAlign: TextAlign.center,
              )),
              Text(
                awayOffTarget.toString(),
                style: style,
              ),
            ],
          ),
          Gap(12.h),
          Row(
            children: [
              Expanded(child: Gap(1)),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.white, width: 6.0),
                    left: BorderSide(color: Colors.white, width: 6.0),
                    right: BorderSide(color: Colors.white, width: 6.0),
                  ),
                ),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        homeOnTarget.toString(),
                        style: style,
                      ),
                      Gap(18.w),
                      const Text(
                        resStrShotsOnTarget,
                        textAlign: TextAlign.center,
                      ),
                      Gap(18.w),
                      Text(
                        awayOnTarget.toString(),
                        style: style,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(child: Gap(1)),
            ],
          )
        ],
      ),
    );
  }
}
