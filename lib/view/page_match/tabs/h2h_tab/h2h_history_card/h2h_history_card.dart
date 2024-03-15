import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/h2h_data.dart';
import 'package:scoremob/view/page_match/tabs/h2h_tab/h2h_history_card/h2h_history_item.dart';
import 'package:scoremob/view/page_match/tabs/h2h_tab/h2h_history_card/h2h_history_item_show_more.dart';

const int collapsedCount = 3;

class H2hHistoryCard extends StatefulWidget {
  H2hHistoryCard({required this.h2hDetails, super.key});

  H2hData h2hDetails;

  @override
  State<H2hHistoryCard> createState() => _H2hHistoryCardState();
}

class _H2hHistoryCardState extends State<H2hHistoryCard> {
  int itemsCount = 0;
  bool collapsed = true;

  @override
  void initState() {
    itemsCount = min(widget.h2hDetails.fixtures.length, collapsedCount) + 1;
    if (widget.h2hDetails.fixtures.length <= collapsedCount) {
      collapsed = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(top: 0.h, bottom: 0.h, right: 14.w, left: 14.w),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: (itemsCount),
            itemBuilder: (context, index) {
              if (collapsed == true && index + 1 == itemsCount) {
                return H2hHistoryItemShowMore(
                  action: () {
                    setState(() {
                      collapsed = false;
                      itemsCount = widget.h2hDetails.fixtures.length;
                    });
                  },
                );
              } else {
                var temp = widget.h2hDetails.fixtures.elementAtOrNull(index);
                return (temp == null) ? Gap(0) : H2hHistoryItem(fixture: temp);
              }
            },
          ),
        ),
      ),
    );
  }
}
