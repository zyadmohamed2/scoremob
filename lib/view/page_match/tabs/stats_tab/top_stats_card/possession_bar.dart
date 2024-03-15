import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PossessionBar extends StatelessWidget {
  PossessionBar({required this.home, required this.away, super.key});

  int home;
  int away;
  final Color homeColor = const Color(0xff143c74);
  final Color awayColor = const Color(0xffaa2a31);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: home,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  bottomLeft: Radius.circular(18.0),
                ),
                color: homeColor,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10.w, top: 8.h, bottom: 8.h),
                child: Text(
                  '$home%',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 10.sp),
                ),
              ),
            ),
          ),
          Gap(1.w),
          Expanded(
            flex: away,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(18.0),
                  bottomRight: Radius.circular(18.0),
                ),
                color: awayColor,
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 10.w, top: 8.h, bottom: 8.h),
                child: Text(
                  '$away%',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 10.sp),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
