import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../page_fixtures/model/fixture.dart';
import '../../../../page_fixtures/widgets/list_item.dart';
import '../../../../theme/cards_config.dart';

class MatchesCard extends StatelessWidget {
  MatchesCard({required this.list, required this.title, super.key});

  List<Fixture> list;
  String title;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) {
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
              Text(title,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                  textAlign: TextAlign.start),
              ..._genFixtures(list),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _genFixtures(List<Fixture> fixtures) {
    fixtures.sort(
      (a, b) {
        return ((a.status.startDateTime?.millisecondsSinceEpoch ?? 0) -
            (b.status.startDateTime?.millisecondsSinceEpoch ?? 0));
      },
    );
    return fixtures.map((e) => FixtureListItem(fixtureData: e)).toList();
  }
}
