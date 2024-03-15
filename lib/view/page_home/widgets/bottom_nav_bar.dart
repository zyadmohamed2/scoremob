import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/res/assets_res.dart';
import 'package:scoremob/view/res/strings.dart';
import 'bottom_nav_icon.dart';

class BottomNavBar extends StatelessWidget {
  int selectedIndex;
  Function onItemTapped;

  BottomNavBar({super.key, required this.selectedIndex, required this.onItemTapped});

  var selectedColor = const Color(0xff222222);
  var unSelectedColor = const Color(0xff9f9f9f);
  var textStyle = TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      height: 2.0,
      letterSpacing: 0.5);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 10.h),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          iconSize: 24.w,
          elevation: 0,
          currentIndex: selectedIndex,
          selectedItemColor: selectedColor,
          onTap: _onItemTap,
          selectedLabelStyle: textStyle.copyWith(
            color: selectedColor,
          ),
          unselectedLabelStyle: textStyle.copyWith(
            color: unSelectedColor,
            fontWeight: FontWeight.w400,
          ),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon:
                  BottomNavIconAsset(asset: AssetsRes.STADIUM_LINE_2),
              activeIcon:
                  BottomNavIconAsset(asset: AssetsRes.STADIUM_FILLED),
              label: resStrMatches,
            ),
            BottomNavigationBarItem(
              icon: BottomNavIcon(icon: FluentIcons.news_24_regular),
              activeIcon: BottomNavIcon(icon: FluentIcons.news_24_filled),
              label: resStrNews,
            ),
            BottomNavigationBarItem(
              icon: BottomNavIcon(icon: FluentIcons.trophy_24_regular),
              activeIcon: BottomNavIcon(icon: FluentIcons.trophy_24_filled),
              label: resStrLeagues,
            ),
            BottomNavigationBarItem(
              icon: BottomNavIcon(icon: FluentIcons.star_24_regular),
              activeIcon: BottomNavIcon(icon: FluentIcons.star_24_filled),
              label: resStrFollowing,
            ),
            BottomNavigationBarItem(
              icon:
                  BottomNavIcon(icon: FluentIcons.line_horizontal_3_20_filled),
              activeIcon:
                  BottomNavIcon(icon: FluentIcons.line_horizontal_3_20_filled),
              label: resStrMore,
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTap(int value) {
    onItemTapped(value);
  }
}

class Info extends StatelessWidget {
  const Info({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 15),
        ),
        Text(
          subTitle,
          style: const TextStyle(color: Colors.white54, fontSize: 15),
        ),
      ],
    );
  }
}

class TopStateRow extends StatelessWidget {
  const TopStateRow({super.key, required this.title, required this.valu});
  final String title;
  final String valu;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
          Text(
            valu,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
