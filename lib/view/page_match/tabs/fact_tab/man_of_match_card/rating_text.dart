import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingText extends StatelessWidget {
  RatingText({required this.text, super.key});
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
      decoration: const BoxDecoration(
          color: Color(0xff4390e5),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 8.sp, color: Colors.white),
          ),
          Icon(
            FluentIcons.star_12_filled,
            size: 8.h,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
