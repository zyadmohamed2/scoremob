import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var topPadding = 8.h;

class BottomNavIcon extends StatelessWidget {
  final IconData icon;

  const BottomNavIcon({required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Icon(icon, size: 24.w),
    );
  }
}

class BottomNavIconAsset extends StatelessWidget {
  final String asset;

  const BottomNavIconAsset({required this.asset, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding),
      child: Image.asset(
        asset,
        width: 24.w,
        height: 18.h,
      ),
    );
  }
}
