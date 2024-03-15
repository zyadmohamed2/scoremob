import 'package:scoremob/data/model/transfers_response/player_transfer_data.dart';
import 'package:scoremob/view/page_team/model/transfer.dart';

class Transfers {
  List<Transfer> ins = <Transfer>[];
  List<Transfer> outs = <Transfer>[];

  Transfers.empty()
      : ins = [],
        outs = [];

  Transfers.fromDTO(List<PlayerTransferDataDTO?>? list, int teamId) {
    list?.forEach((element) {
      if (element?.transfers?.firstOrNull?.teams?.teamsIn?.id == teamId) {
        outs.add(Transfer.fromDTO(element));
      }
      if (element?.transfers?.firstOrNull?.teams?.out?.id == teamId) {
        ins.add(Transfer.fromDTO(element));
      }
    });
  }
}
