import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class EventSubView extends StatelessWidget {
  EventSubView(
      {required this.isHome,
      required this.inPlayer,
      required this.outPlayer,
      super.key});

  bool isHome;
  String inPlayer;
  String outPlayer;

  @override
  Widget build(BuildContext context) {
    var iconSize = 14.w;
    var green = const Color(0xff48a06c);
    var red = const Color(0xffd24c43);
    var textStyle = TextStyle(
      fontSize: 10.sp,
    );

    var names = Column(
      crossAxisAlignment:
          isHome ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(
          inPlayer,
          style: textStyle.copyWith(color: green),
        ),
        // Gap(2.h),
        Text(
          outPlayer,
          style: textStyle.copyWith(color: red),
        ),
      ],
    );
    var icons = Column(
      children: [
        Icon(
          isHome
              ? FluentIcons.arrow_circle_right_12_filled
              : FluentIcons.arrow_circle_left_12_filled,
          size: iconSize,
          color: green,
        ),
        Gap(2.h),
        Icon(
          isHome
              ? FluentIcons.arrow_circle_left_12_filled
              : FluentIcons.arrow_circle_right_12_filled,
          size: iconSize,
          color: red,
        )
      ],
    );

    List<Widget> widgets = [];

    if (isHome) {
      widgets.addAll([icons, Gap(14.w), names]);
    } else {
      widgets.addAll([names, Gap(14.w), icons]);
    }

    return Row(
      mainAxisAlignment:
          isHome ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: widgets,
    );
  }
}
