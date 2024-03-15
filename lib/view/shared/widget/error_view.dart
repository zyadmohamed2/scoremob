import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../config.dart';

class ErrorView extends StatefulWidget {
  ErrorView({required this.text, super.key});

  String? text;

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
            EdgeInsets.only(top: 128.h, left: 24.w, right: 24.w, bottom: 32.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/icons/cloud_error.png",
              width: 128.w,
              height: 128.h,
            ),
            Gap(16.h),
            GestureDetector(
              child: Text('Error Getting Data'),
              onTap: () {
                setState(() {
                  showError = true;
                });
              },
            ),
            Gap(16.h),
            Visibility(
                visible: (ERROR_VIEW_SHOWS_DETAILS_ON_TAP && showError),
                child: Text(
                  widget.text ?? 'Unknown Error',
                  style: TextStyle(
                    fontSize: 8.sp,
                  ),
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
