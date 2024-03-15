import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../../res/strings.dart';
import '../../../../model/event_type.dart';

class EventVarView extends StatelessWidget {
  EventVarView({required this.isHome, required this.reason, super.key});

  bool isHome;
  String reason;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    var card = Image.asset(
      'assets/icons/var_icon.png',
      width: 20.w,
      height: 20.h,
    );

    var title = Text(
      resStrVarCheck,
      style: TextStyle(
        fontSize: 10.sp,
      ),
    );

    var subTitle = Text(
      reason,
      style: TextStyle(fontSize: 10.sp, color: const Color(0xff636363)),
    );
    var textColumn = Column(
      crossAxisAlignment:
          isHome ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [title, subTitle],
    );

    if (isHome) {
      widgets.addAll([card, Gap(14.w), textColumn]);
    } else {
      widgets.addAll([textColumn, Gap(14.w), card]);
    }

    return Row(
      mainAxisAlignment:
          isHome ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: widgets,
    );
  }
}
