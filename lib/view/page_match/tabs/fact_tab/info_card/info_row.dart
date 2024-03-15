import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/shared/widget/tournament_logo.dart';

class InfoRow extends StatelessWidget {
  InfoRow(
      {required this.text,
      this.iconData = FluentIcons.calendar_16_filled,
      this.logo,
      super.key});

  String text;
  String? logo;
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    var size = 16.0;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ((logo == null)
            ? Icon(
                iconData,
                size: size,
              )
            : TournamentLogo(
                url: logo!,
                size: size,
              )),
        Gap(10.w),
        Expanded(child: Text(text))
      ],
    );
  }
}
