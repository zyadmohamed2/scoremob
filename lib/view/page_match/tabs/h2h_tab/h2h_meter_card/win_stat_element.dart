import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class WinStatElement extends StatelessWidget {
  WinStatElement(
      {required this.title,
      required this.color,
      required this.percentage,
      required this.wins,
      this.textColor = Colors.white,
      super.key});

  int wins;
  int percentage;
  String title;
  Color color;
  Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30.h,
          height: 30.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(4.0),
            ),
            color: color,
          ),
          child: Center(
            child: Text(
              wins.toString(),
              style: TextStyle(fontSize: 14.sp, color: textColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Gap(6.w),
        Column(
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 10.sp),
            ),
            Gap(8.h),
            Text('$percentage%',
                style: TextStyle(color: Color(0xff7b7b7b), fontSize: 10.sp)),
          ],
        )
      ],
    );
  }
}
