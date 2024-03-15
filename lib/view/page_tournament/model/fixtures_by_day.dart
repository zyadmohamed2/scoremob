import 'package:flutter/material.dart';

import '../../../data/model/fixtures_response/fixture_data.dart';
import '../../page_fixtures/model/fixture.dart';

class FixturesByDay {
  Map<DateTime, List<Fixture>> dates = {};

  FixturesByDay.empty();

  FixturesByDay.fromDTO(List<FixtureDataDTO>? dto) {
    var fixtures = dto?.map((e) => Fixture.fromDTO(e)).toList() ?? [];

    for (var element in fixtures) {
      var date =
          DateUtils.dateOnly(element?.status?.startDateTime ?? DateTime.now());
      var list = dates[date] ?? [];
      list.add(element);
      dates[date] = list;
    }
  }
}
