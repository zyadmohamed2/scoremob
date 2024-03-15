import 'package:flutter/material.dart';
import 'package:scoremob/data/model/fixtures_response/statistics.dart';
import 'package:scoremob/view/page_match/model/player.dart';
import 'package:scoremob/view/shared/model/team.dart';

class Statistics {
  Team team;
  int ballPossession = 0;
  double goalsExpected = 0;
  int shotsTotal = 0;
  int shotsOnGoal = 0;
  int shotsOffGoal = 0;
  int fouls = 0;
  int offsides = 0;
  int corners = 0;
  int passesTotal = 0;
  int passesAccurate = 0;
  int passesAccuratePercentage = 0;
  int shotsBlocked = 0;
  int shotsOutsideBox = 0;
  int shotsInsideBox = 0;
  int cardYellow = 0;
  int cardRed = 0;
  int goalkeeperSaves = 0;
  double avrRating100 = 0;
  int passesKey = 0;
  int tacklesTotal = 0;
  int blocks = 0;
  int interceptions = 0;
  int duelsTotal = 0;
  int duelsWon = 0;
  int dribblesAttempts = 0;
  int dribblesSuccess = 0;
  int dribblesPast = 0;

  bool isAvailable = false;

  Statistics.empty() : this.team = Team.empty();

  Statistics.fromDTO(StatisticsDTO? dto) : this.team = Team.fromDTO(dto?.team) {
    if (dto != null) {
      isAvailable = true;
    }
    dto?.statistics?.forEach((element) {
      try {
        if (element?.type?.toLowerCase() == 'ball possession') {
          this.ballPossession = _parsePercentage(element?.value);
        }
        if (element?.type?.toLowerCase() == 'expected_goals') {
          this.goalsExpected = _parseDouble(element?.value);
        }
        if (element?.type?.toLowerCase() == 'total shots') {
          this.shotsTotal = _parseInt(element?.value);
        }
        if (element?.type?.toLowerCase() == 'fouls') {
          this.fouls = _parseInt(element?.value);
        }
        if (element?.type?.toLowerCase() == 'offsides') {
          this.offsides = _parseInt(element?.value);
        }
        if (element?.type?.toLowerCase() == 'corner kicks') {
          this.corners = _parseInt(element?.value);
        }
        if (element?.type?.toLowerCase() == 'total passes') {
          this.passesTotal = _parseInt(element?.value);
        }
        if (element?.type?.toLowerCase() == 'passes accurate') {
          this.passesAccurate = _parseInt(element?.value);
        }
        if (element?.type?.toLowerCase() == 'shots on goal') {
          this.shotsOnGoal = _parseInt(element?.value);
        }
        if (element?.type?.toLowerCase() == 'shots off goal') {
          this.shotsOffGoal = _parseInt(element?.value);
        }
        if (element?.type?.toLowerCase() == 'passes %') {
          this.passesAccuratePercentage = _parsePercentage(element?.value);
        }
        if (element?.type?.toLowerCase() == 'blocked shots') {
          this.shotsBlocked = _parseInt(element?.value);
        }
        if (element?.type?.toLowerCase() == 'shots insidebox') {
          this.shotsInsideBox = _parseInt(element?.value);
        }
        if (element?.type?.toLowerCase() == 'shots outsidebox') {
          this.shotsOutsideBox = _parseInt(element?.value);
        }
        if (element?.type?.toLowerCase() == 'yellow cards') {
          this.cardYellow = _parseInt(element?.value);
        }
        if (element?.type?.toLowerCase() == 'red cards') {
          this.cardRed = _parseInt(element?.value);
        }
        if (element?.type?.toLowerCase() == 'goalkeeper saves') {
          this.goalkeeperSaves = _parseInt(element?.value);
        }
      } catch (e, stackTrace) {
        debugPrint(e.toString());
        debugPrintStack(stackTrace: stackTrace);
      }
    });
  }

  int _parsePercentage(value) {
    // "72%"
    return int.tryParse(value.toString().replaceAll('%', '')) ?? 0;
  }

  double _parseDouble(value) {
    // "1.56"
    return double.tryParse(value.toString()) ?? 0;
  }

  int _parseInt(value) {
    return int.tryParse(value.toString()) ?? 0;
  }

  String getAccuratePassesWithPercentage() {
    return '$passesAccurate ($passesAccuratePercentage%)';
  }

  void getStatsFromPlayers(List<PlayerStats> playersWithStats) {
    var list =
        playersWithStats.where((element) => element.team.id == this.team.id);
    double avrRating100 = 0;
    int passesKey = 0;
    int tacklesTotal = 0;
    int blocks = 0;
    int interceptions = 0;
    int duelsTotal = 0;
    int duelsWon = 0;
    int dribblesAttempts = 0;
    int dribblesSuccess = 0;
    int dribblesPast = 0;

    list.forEach((element) {
      avrRating100 += element.getRating100();
      passesKey += element.getKeyPasses();
      tacklesTotal += element.getTotalTackles();
      blocks += element.getBlocks();
      interceptions += element.getInterceptions();
      duelsTotal += element.getTotalDuels();
      duelsWon += element.getWonDuels();
      dribblesAttempts += element.getAttemptsDribbles();
      dribblesSuccess += element.getSuccessDribbles();
      dribblesPast += element.getPastDribbles();
    });

    avrRating100 = avrRating100 / ((list.isEmpty) ? 1 : (list.length));
    this.avrRating100 = avrRating100;
    this.passesKey = passesKey;
    this.tacklesTotal = tacklesTotal;
    this.blocks = blocks;
    this.interceptions = interceptions;
    this.duelsTotal = duelsTotal;
    this.duelsWon = duelsWon;
    this.dribblesAttempts = dribblesAttempts;
    this.dribblesSuccess = dribblesSuccess;
    this.dribblesPast = dribblesPast;
  }
}
