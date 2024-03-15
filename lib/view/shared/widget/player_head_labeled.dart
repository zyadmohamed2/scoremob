import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/tabs/fact_tab/man_of_match_card/rating_text.dart';
import 'package:scoremob/view/shared/widget/club_logo.dart';
import 'package:scoremob/view/shared/widget/player_head.dart';

class PlayerHeadLabeled extends StatelessWidget {
  PlayerHeadLabeled({
    required this.url,
    this.size = 24,
    this.rating,
    this.isPOTM,
    this.substitutedOut,
    this.yellowCard,
    this.redCard,
    this.assists,
    this.goals,
    this.substitutedIn,
    this.missedPenalty,
    this.injured,
    this.substitutionTime,
    this.clubLogo,
    super.key,
  });

  String url;
  double size;
  double? rating;
  bool? isPOTM;
  bool? substitutedOut;
  bool? substitutedIn;
  String? substitutionTime;
  bool? yellowCard;
  bool? missedPenalty;
  bool? redCard;
  bool? injured;
  int? goals;
  int? assists;
  String? clubLogo;

  var marginW = 16.0;
  var marginH = 2.0;

  var boxShadow = BoxShadow(
    color: Colors.grey.withOpacity(0.5),
    spreadRadius: 1,
    blurRadius: 2,
    offset: Offset(0, 1),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (marginW + size).w,
      height: (marginH + size).h,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          PlayerHead(
            url: url,
            size: size,
          ),
          Align(
              alignment: AlignmentDirectional.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // (substitutionTime != null) ? _subText(substitutedOut, substitutedIn,substitutionTime) : Gap(0),
                  (substitutedOut == true) ? _subCircle(false) : const Gap(0),
                  (substitutedIn == true) ? _subCircle(true) : const Gap(0),
                  const Expanded(child: Gap(0)),
                  (rating != null)
                      ? _ratingText(rating!, isPOTM == true)
                      : Gap(0),
                ],
              )),
          Align(
              alignment: AlignmentDirectional.center,
              child: Row(
                children: [
                  (yellowCard == true) ? _cardCircle(false) : Gap(0),
                  (redCard == true) ? _cardCircle(true) : Gap(0),
                  const Expanded(child: Gap(0)),
                  (missedPenalty == true) ? _missedCircle() : Gap(0),
                ],
              )),
          Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Row(
                children: [
                  (clubLogo != null) ? _clubLogoCircle(clubLogo!) : Gap(0),
                  ((assists ?? 0) >= 1) ? _assistsCircle(assists!) : Gap(0),
                  const Expanded(child: Gap(0)),
                  ((goals ?? 0) >= 1) ? _goalsCircle(goals!) : Gap(0),
                  (injured == true) ? _injuredCircle() : Gap(0),
                ],
              )),
        ],
      ),
    );
  }

  Widget _ratingText(double rating, bool showStar) {
    var color = const Color(0xffe69135);
    if (rating >= 7) {
      color = const Color(0xff5fcc63);
    }
    if (showStar) {
      color = const Color(0xff4391e4);
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        boxShadow: [boxShadow],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            rating.toString(),
            style: TextStyle(fontSize: 8.sp, color: Colors.white),
          ),
          showStar ? Gap(2.w) : Gap(0),
          showStar
              ? Icon(
                  FluentIcons.star_12_filled,
                  size: 8.h,
                  color: Colors.white,
                )
              : Gap(0)
        ],
      ),
    );
  }

  Widget _subCircle(bool isIn) {
    var color = isIn ? const Color(0xff00985f) : const Color(0xffdb726a);
    var icon = isIn
        ? FluentIcons.arrow_right_12_filled
        : FluentIcons.arrow_left_12_filled;
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [boxShadow],
      ),
      child: Center(
        child: Icon(
          icon,
          size: 10,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _cardCircle(bool red) {
    var color = const Color(0xfff8d649);
    if (red) {
      color = const Color(0xffec6073);
    }

    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [boxShadow],
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Center(
          child: AspectRatio(
            aspectRatio: 4 / 6,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: color,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _assistsCircle(int assists) {
    return Row(
      children: [
        (assists > 1)
            ? Text(
                '${assists}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp),
              )
            : Gap(0),
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [boxShadow],
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
                child: Image.asset(
              "assets/icons/shoe.png",
              height: 14,
              width: 14,
            )),
          ),
        ),
      ],
    );
  }

  Widget _goalsCircle(int goals) {
    return Row(
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [boxShadow],
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
                child: Image.asset(
              "assets/icons/ball_small.png",
              height: 14,
              width: 14,
            )),
          ),
        ),
        (goals > 1)
            ? Text(
                '${goals}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp),
              )
            : Gap(0),
      ],
    );
  }

  Widget _missedCircle() {
    return Row(
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [boxShadow],
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
                child: Image.asset(
              "assets/icons/missed_goal_small.png",
              height: 14,
              width: 14,
            )),
          ),
        ),
      ],
    );
  }

  Widget _injuredCircle() {
    return Row(
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [boxShadow],
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Center(
              child: Image.asset(
                "assets/icons/add_small.png",
                height: 14,
                width: 14,
                color: Color(0xffda7169),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _clubLogoCircle(String logo) {
    return Row(
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [boxShadow],
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
                child: ClubLogo(
              url: logo,
              size: 14,
            )),
          ),
        ),
      ],
    );
  }

  Widget _subText(bool? substitutedOut, bool? substitutedIn, String? time) {
    var color = Color(0x000000);
    if (substitutedOut == true) {
      color = Color(0xffdb726a);
    }
    if (substitutedIn == true) {
      color = Color(0xff00985f);
    }

    return Text(
      time ?? '',
      style: TextStyle(
        color: color,
        fontSize: 10.sp,
        shadows: <Shadow>[
          Shadow(
              offset: Offset(0.0, 1.0), blurRadius: 3.0, color: Colors.white),
        ],
      ),
    );
  }
}
