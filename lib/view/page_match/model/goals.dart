import 'package:scoremob/data/model/fixtures_response/fixture_goals.dart';
import 'package:scoremob/data/model/fixtures_response/fixture_score.dart';

class Goals {
  int? home;
  int? away;
  int? pHome;
  int? pAway;

  Goals(this.home, this.away, this.pHome, this.pAway);

  Goals.empty()
      : this.away = 0,
        this.home = 0,
        this.pHome = 0,
        this.pAway = 0;

  Goals.fromDTO(GoalsDTO? dto, ScoreDTO? score)
      : this.away = dto?.away,
        this.home = dto?.home,
        this.pHome = score?.penalty?.home,
        this.pAway = score?.penalty?.away;

  String getGoalsFormatted() {
    return '$home - $away';
  }

  String getGoalsFormattedWide() {
    return '$home   -   $away';
  }

  String getGoalsWithPenaltiesFormatted() {
    if (pHome == null && pAway == null) {
      return getGoalsFormatted();
    }
    var pphome = (pHome == null) ? '' : '($pHome) ';
    var ppaway = (pAway == null) ? '' : ' ($pAway)';

    return pphome + '$home - $away' + ppaway;
  }

  String getGoalsWithPenaltiesFormattedWide() {
    if (pHome == null && pAway == null) {
      return getGoalsFormattedWide();
    }
    var pphome = (pHome == null) ? '' : '($pHome) ';
    var ppaway = (pAway == null) ? '' : ' ($pAway)';

    return pphome + '$home  -  $away' + ppaway;
  }

  Goals copy() {
    return Goals(this.home, this.away, this.pHome, this.pAway);
  }

  bool isDraw() {
    return (this.home == this.away && this.pHome == this.pAway);
  }

  GoalsResultEnum getResultEnum() {
    if (isDraw()) {
      return GoalsResultEnum.Draw;
    }
    if ((home ?? 0) > (away ?? 0)) {
      return GoalsResultEnum.HomeWon;
    }
    if ((home ?? 0) < (away ?? 0)) {
      return GoalsResultEnum.AwayWon;
    }

    if ((pHome ?? 0) > (pAway ?? 0)) {
      return GoalsResultEnum.HomeWon;
    }
    return GoalsResultEnum.AwayWon;
  }
}

enum GoalsResultEnum { HomeWon, Draw, AwayWon }
