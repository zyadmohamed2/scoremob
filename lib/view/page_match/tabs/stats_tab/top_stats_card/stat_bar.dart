import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class StatBar extends StatelessWidget {
  StatBar(
      {required this.title,
      required this.homeValue,
      required this.awayValue,
      required this.higherValueIsHome,
      super.key});

  String title;
  String homeValue;
  String awayValue;
  bool higherValueIsHome;
  final Color homeColor = const Color(0xff143c74);
  final Color awayColor = const Color(0xffaa2a31);

  @override
  Widget build(BuildContext context) {
    var areSame = homeValue == awayValue;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _valueText(
            color: homeColor,
            value: homeValue,
            isHigherValue: areSame ? false : higherValueIsHome),
        Expanded(child: Gap(2.w)),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12.sp,
          ),
        ),
        Expanded(child: Gap(2.w)),
        _valueText(
            color: awayColor,
            value: awayValue,
            isHigherValue: areSame ? false : (!higherValueIsHome)),
      ],
    );
  }

  Widget _valueText(
      {required String value,
      required Color color,
      bool isHigherValue = false}) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 24.w,
      ),
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(18.0),
        ),
        color: isHigherValue ? color : Colors.white,
      ),
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: isHigherValue ? Colors.white : Colors.black,
            fontWeight: isHigherValue ? FontWeight.w700 : FontWeight.w400,
            fontSize: 10.sp),
      ),
    );
  }
}
