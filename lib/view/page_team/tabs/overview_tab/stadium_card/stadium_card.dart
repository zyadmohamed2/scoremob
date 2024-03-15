import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../res/strings.dart';
import '../../../../theme/cards_config.dart';
import '../../../model/venue.dart';

class StadiumCard extends StatelessWidget {
  StadiumCard({required this.venue, super.key});

  Venue? venue;

  @override
  Widget build(BuildContext context) {
    if (venue == null) {
      return const Gap(0);
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vPad.h, horizontal: hPad.w),
      child: Card(
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(corners),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 16.h, bottom: 14.h, right: 14.w, left: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(resStrStadium,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                  textAlign: TextAlign.start),
              Gap(20.w),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gap(8.w),
                  Image.asset(
                    'assets/icons/venue.png',
                    width: 32,
                    height: 32,
                    color: Color(0xff7a7a7a),
                  ),
                  Gap(16.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(venue?.name ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 12.sp),
                            textAlign: TextAlign.start),
                        Gap(4.h),
                        Text(venue?.address ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: const Color(0xff7e7e7e)),
                            textAlign: TextAlign.start),
                      ],
                    ),
                  )
                ],
              ),
              Gap(12.h),
              Divider(),
              Gap(12.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(child: _item(venue?.surface ?? '', resStrGrass)),
                  Expanded(
                      child: _item(
                          venue?.capacity.toString() ?? '', resStrCapacity)),
                  Expanded(child: _item(venue?.city ?? '', resStrCity)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _item(String value, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(value,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
            textAlign: TextAlign.start),
        Gap(4.h),
        Text(title,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
                color: const Color(0xff7e7e7e)),
            textAlign: TextAlign.start),
      ],
    );
  }
}
