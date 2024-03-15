import 'package:equatable/equatable.dart';

import '../../../utils/date_utils.dart';
import '../model/fixture_day.dart';
import '../model/tab_day.dart';

enum FixturesPageStateEnum { Init, Loading, Error, Success }

final class FixturesPageState extends Equatable {
  String? error;
  FixturesPageStateEnum state;
  DateTime selectedDay;
  Map<DateTime, FixtureDay> fixtureDays = Map();

  FixturesPageState({required this.state, required this.selectedDay});

  FixturesPageState.all(
      {required this.state,
      required this.error,
      required this.fixtureDays,
      required this.selectedDay});

  @override
  List<Object?> get props => [fixtureDays, error, state, selectedDay];

  FixturesPageState copyWith({
    String? error,
    FixturesPageStateEnum? state,
    DateTime? selectedDate,
    List<TabDay>? tabDays,
    Map<DateTime, FixtureDay>? fixtureDays,
  }) {
    return FixturesPageState.all(
      fixtureDays: fixtureDays ?? this.fixtureDays,
      error: error ?? this.error,
      state: state ?? this.state,
      selectedDay: selectedDate ?? selectedDay,
    );
  }

  List<TabDay> getTabDays() {
    var startDay = getFixtureStartDate(this.selectedDay);
    var endDay = getFixtureEndDate(this.selectedDay);
    var res = List<TabDay>.empty(growable: true);

    var diff = endDay?.difference(startDay!).inDays ?? 0;

    for (int i = 0; i <= diff; i++) {
      DateTime day = startDay?.add(Duration(days: i)) ?? DateTime.now();
      res.add(TabDay(i, day));
    }

    return res;
  }

  DateTime getStartDay() {
    return getFixtureStartDate(this.selectedDay);
  }

  DateTime getEndDay() {
    return getFixtureEndDate(this.selectedDay);
  }
}
