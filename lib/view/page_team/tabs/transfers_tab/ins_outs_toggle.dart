import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/strings.dart';

class InsOutsToggle extends StatefulWidget {
  InsOutsToggle({required this.value, required this.callback, super.key});

  Function(bool) callback;
  bool value;

  @override
  State<InsOutsToggle> createState() => _InsOutsToggleState();
}

class _InsOutsToggleState extends State<InsOutsToggle> {
  List<bool> switchs = [];

  @override
  void initState() {
    if (widget.value) {
      switchs = [true, false];
    } else {
      switchs = [false, true];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ToggleButtons(
            isSelected: switchs,
            splashColor: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(18.0),
            color: Colors.black,
            borderColor: Colors.grey.shade300,
            borderWidth: 0,
            fillColor: Colors.white,
            selectedBorderColor: Colors.white,
            selectedColor: Colors.black,
            onPressed: (index) {
              setState(() {
                switchs = List.generate(switchs.length, (jndex) {
                  if (jndex == index) {
                    return true;
                  }
                  return false;
                });
                bool isIns = true;
                if (index == 1) {
                  isIns = false;
                }
                widget.callback(isIns);
              });
            },
            children: [
              _pill(resStrPlayersIn),
              _pill(resStrPlayersOut),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pill(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 38.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 10.sp),
      ),
    );
  }
}
