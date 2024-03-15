import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../model/event_type.dart';

class EventCardView extends StatelessWidget {
  EventCardView(
      {required this.isHome,
      required this.cardType,
      required this.playerName,
      required this.reason,
      super.key});

  bool isHome;
  EventTypeCardEnum cardType;
  String playerName;
  String reason;

  @override
  Widget build(BuildContext context) {
    var cardColor = Colors.grey.shade700;
    switch (cardType) {
      case EventTypeCardEnum.Yellow:
        cardColor = const Color(0xfff9d649);
        break;
      case EventTypeCardEnum.Red:
        cardColor = const Color(0xffff5450);
        break;
    }
    List<Widget> widgets = [];
    var card = Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(2.0),
      ),
      width: 12.w,
      height: 16.h,
    );

    var title = Text(
      playerName,
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
