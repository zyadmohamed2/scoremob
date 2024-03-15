import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoremob/res/assets_res.dart';

class TournamentLogo extends StatelessWidget {
  String url;
  double size;
  String assetName;

  TournamentLogo(
      {required this.url,
      this.assetName = AssetsRes.LEAGUE_LIGHT_GREY,
      this.size = 24,
      super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      height: size.h,
      width: size.w,
      image: NetworkImage(url),
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset(assetName);
      },
      placeholder: AssetImage(assetName),
    );
  }
}
