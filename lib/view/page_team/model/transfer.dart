import '../../../data/model/transfers_response/player_transfer_data.dart';
import '../../shared/model/team.dart';

class Transfer {
  String playerName;
  int playerId;
  String update;
  String date; //2021-08-31
  String type;
  Team outTeam;
  Team inTeam;

  Transfer(this.playerName, this.playerId, this.update, this.date, this.type,
      this.outTeam, this.inTeam);

  Transfer.empty()
      : playerName = '',
        playerId = 0,
        update = '',
        date = '',
        type = '',
        inTeam = Team.empty(),
        outTeam = Team.empty();

  Transfer.fromDTO(PlayerTransferDataDTO? dto)
      : playerId = dto?.player?.id ?? 0,
        playerName = dto?.player?.name ?? '',
        update = dto?.update ?? '',
        date = dto?.transfers?.firstOrNull?.date ?? '',
        type = dto?.transfers?.firstOrNull?.type ?? '',
        inTeam = Team.fromDTO(dto?.transfers?.firstOrNull?.teams?.teamsIn),
        outTeam = Team.fromDTO(dto?.transfers?.firstOrNull?.teams?.out);

  String getPlayerPhoto() {
    return "https://media-4.api-sports.io/football/players/$playerId.png";
  }
}
