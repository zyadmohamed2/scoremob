import 'package:flutter/material.dart';
import 'package:scoremob/data/model/fixtures_response/fixture_match.dart';
import 'package:scoremob/utils/date_utils.dart';

class FixtureStatus {
  final int id;
  final String statusShort;
  final String statusLong;
  final DateTime? startDateTime;
  final int? elapsedMinutes;
  GameStatusEnum statusEnum;

  FixtureStatus.empty()
      : this.statusShort = '',
        this.statusLong = '',
        this.id = 0,
        this.statusEnum = GameStatusEnum.Unknown,
        this.startDateTime = null,
        this.elapsedMinutes = null;

  FixtureStatus.fromDTO(FixtureMatchDTO? dto)
      : this.statusShort = dto?.status?.short ?? '',
        this.statusLong = dto?.status?.long ?? '',
        this.id = dto?.id ?? 0,
        this.startDateTime = dto?.date?.toDateTime(),
        this.statusEnum = GameStatusEnum.Unknown,
        this.elapsedMinutes = dto?.status?.elapsed {
    this.statusEnum = _getGameStatus();
  }

  bool shouldShowManOfMatch() {
    return (this.statusEnum == GameStatusEnum.Finished);
  }

  bool shouldShowEvents() {
    return (this.statusEnum == GameStatusEnum.Finished ||
        this.statusEnum == GameStatusEnum.Started);
  }

  GameStatusEnum _getGameStatus() {
    if ((['TBD', 'NS'].contains(this.statusShort))) {
      return GameStatusEnum.NotStarted;
    }
    if ((['1H', 'HT', '2H', 'ET', 'BT', 'P', 'LIVE', 'SUSP', 'INT']
        .contains(this.statusShort))) {
      return GameStatusEnum.Started;
    }
    if ((['FT', 'AET', 'PEN'].contains(this.statusShort))) {
      return GameStatusEnum.Finished;
    }
    if ((['PST'].contains(this.statusShort))) {
      return GameStatusEnum.Postponed;
    }
    if ((['CANC', 'ABD', 'AWD', 'WO'].contains(this.statusShort))) {
      return GameStatusEnum.Cancelled;
    }
    return GameStatusEnum.Unknown;
  }

  String getTime() {
    return startDateTime?.formatHH_mm() ?? '';
  }

  String getFullDate() {
    // Sun, May 26, 2024
    return this.startDateTime?.FormatDDDMMMmmYYYY() ?? '';
  }

  String getFullDateTime() {
    // Sun, May 26, 2024, 14:30
    return this.startDateTime?.FormatDDDMMMmmYYYYHHmm() ?? '';
  }

  String getShortDate() {
    // May 26
    return this.startDateTime?.formatMM_DD() ?? '';
  }

  Color getStateTextColor() {
    return _textColorMap[statusShort] ?? Color(0xff717171);
  }

  Color getStateTextBack() {
    return _backColorMap[statusShort] ?? Color(0xfff0f0f0);
  }

  String getSmallState() {
    return (gameInPlay()) ? this.elapsedMinutes.toString() : this.statusShort;
  }

  bool gameInPlay() {
    return (['1H', '2H', 'ET'].contains(this.statusShort));
  }

  bool shouldShowStateInFixtureItem() {
    return !(this.statusShort == 'TBD' || this.statusShort == 'NS');
  }

  bool firstTabShouldBePreview() {
    return (this.statusEnum == GameStatusEnum.Cancelled ||
        this.statusEnum == GameStatusEnum.Postponed ||
        this.statusEnum == GameStatusEnum.NotStarted);
  }

  final Map<String, Color> _textColorMap = {
    'TBD': Color(0xff717171),
    'NS': Color(0xff717171),
    '1H': Color(0xffffffff),
    'HT': Color(0xffffffff),
    '2H': Color(0xffffffff),
    'ET': Color(0xffffffff),
    'BT': Color(0xffffffff),
    'P': Color(0xffffffff),
    'SUSP': Color(0xff717171),
    'INT': Color(0xffffffff),
    'FT': Color(0xff717171),
    'AET': Color(0xff717171),
    'PEN': Color(0xff717171),
    'PST': Color(0xff717171),
    'CANC': Color(0xff717171),
    'ABD': Color(0xff717171),
    'AWD': Color(0xff717171),
    'WO': Color(0xff717171),
    'LIVE': Color(0xffffffff),
  };
  final Map<String, Color> _backColorMap = {
    'TBD': Color(0xfff0f0f0),
    'NS': Color(0xfff0f0f0),
    '1H': Color(0xff439664),
    'HT': Color(0xff439664),
    '2H': Color(0xff439664),
    'ET': Color(0xff439664),
    'BT': Color(0xff439664),
    'P': Color(0xff439664),
    'SUSP': Color(0xfff0f0f0),
    'INT': Color(0xff439664),
    'FT': Color(0xfff0f0f0),
    'AET': Color(0xfff0f0f0),
    'PEN': Color(0xfff0f0f0),
    'PST': Color(0xfff0f0f0),
    'CANC': Color(0xfff0f0f0),
    'ABD': Color(0xfff0f0f0),
    'AWD': Color(0xfff0f0f0),
    'WO': Color(0xfff0f0f0),
    'LIVE': Color(0xff439664),
  };

  bool shouldShowFTevent() {
    return (this.statusEnum == GameStatusEnum.Finished);
  }

  String statusLongOrTime() {
    return (gameInPlay()) ? '${this.elapsedMinutes}\'' : this.statusLong;
  }

  bool isPostponedOrCancelled() {
    var status = _getGameStatus();
    if (status == GameStatusEnum.Cancelled ||
        status == GameStatusEnum.Postponed) {
      return true;
    } else {
      return false;
    }
  }
}

enum GameStatusEnum {
  NotStarted,
  Started,
  Finished,
  Postponed, //Postponed to another day, once the new date and time is known the status will change to Scheduled
  Cancelled,
  Unknown
}
