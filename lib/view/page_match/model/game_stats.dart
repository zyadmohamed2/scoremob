import 'package:scoremob/data/model/standings_response/standing_stat.dart';

class GamesStats {
  int played;
  int won;
  int draw;
  int lose;
  int goalsFor;
  int goalsAgainst;

  GamesStats(this.played, this.won, this.draw, this.lose, this.goalsFor,
      this.goalsAgainst);

  GamesStats.empty()
      : this.won = 0,
        this.played = 0,
        this.draw = 0,
        this.lose = 0,
        this.goalsFor = 0,
        this.goalsAgainst = 0;

  GamesStats.fromDTO(StandingStatDTO? dto)
      : this.played = dto?.played ?? 0,
        this.won = dto?.win ?? 0,
        this.draw = dto?.draw ?? 0,
        this.lose = dto?.lose ?? 0,
        this.goalsFor = dto?.goals?.goalsFor ?? 0,
        this.goalsAgainst = dto?.goals?.against ?? 0;
}
