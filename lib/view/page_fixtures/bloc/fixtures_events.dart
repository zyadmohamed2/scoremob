import 'package:equatable/equatable.dart';

sealed class FixturesEvent extends Equatable {
  const FixturesEvent();

  @override
  List<Object> get props => [];
}

final class FixturesEventInit extends FixturesEvent {
  const FixturesEventInit();
}

final class FixturesEventRefresh extends FixturesEvent {
  const FixturesEventRefresh();
}

final class FixturesEventClicked extends FixturesEvent {
  final int fixtureId;

  const FixturesEventClicked(this.fixtureId);
}

final class FixturesEventChangeDate extends FixturesEvent {
  final DateTime newDate;

  const FixturesEventChangeDate(this.newDate);
}
