import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class EventTimeView extends StatelessWidget {
  EventTimeView({required this.score, required this.slice, super.key});

  String score;
  EventTimeSlices slice;

  @override
  Widget build(BuildContext context) {
    var line = Expanded(
      child: Container(
        color: Color(0xfff3f3f3),
        height: 1.h,
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          line,
          Gap(14.w),
          _getIcon(),
          Gap(10.w),
          Text(score),
          Gap(14.w),
          line
        ],
      ),
    );
  }

  Widget _getIcon() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 26.h,
          height: 26.h,
          child: CircularProgressIndicator(
            value: _getProgress(),
            backgroundColor: const Color(0xfff3f3f3),
            strokeWidth: 2.4,
            color: Colors.black,
          ),
        ),
        Text(_getText(),
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12.sp),
            textAlign: TextAlign.center)
      ],
    );
  }

  String _getText() {
    switch (slice) {
      case EventTimeSlices.halfTime:
        return 'HT';
      case EventTimeSlices.fullTime:
        return 'FT';
      case EventTimeSlices.penalties:
        return 'AP';
      case EventTimeSlices.extraTime:
        return 'AET';
    }
  }

  double _getProgress() {
    switch (slice) {
      case EventTimeSlices.halfTime:
        return 0.5;
      case EventTimeSlices.fullTime:
        return 1.0;
      case EventTimeSlices.penalties:
        return 1.0;
      case EventTimeSlices.extraTime:
        return 1.0;
    }
  }
}

enum EventTimeSlices { halfTime, fullTime, extraTime, penalties }
