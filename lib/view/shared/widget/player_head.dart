import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoremob/res/assets_res.dart';

class PlayerHead extends StatelessWidget {
  String url;
  double size;
  String assetName;

  PlayerHead(
      {required this.url,
      this.assetName = AssetsRes.HEAD,
      this.size = 24,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: Colors.white,
        child: FadeInImage(
          height: size.w,
          width: size.w,
          image: NetworkImage(url),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(assetName);
          },
          placeholder: AssetImage(assetName),
        ),
      ),
    );
  }
}
