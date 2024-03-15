import 'package:flutter/material.dart';
import 'package:scoremob/view/shared/widget/club_logo.dart';

class StatHeaderLogo extends StatelessWidget {
  StatHeaderLogo(
      {required this.title,
      required this.homeLogo,
      required this.awayLogo,
      super.key});

  String title;
  String homeLogo;
  String awayLogo;

  @override
  Widget build(BuildContext context) {
    var logoSize = 28.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClubLogo(
          url: homeLogo,
          size: logoSize,
        ),
        Expanded(
            child: Text(
          title,
          textAlign: TextAlign.center,
        )),
        ClubLogo(
          url: awayLogo,
          size: logoSize,
        ),
      ],
    );
  }
}
