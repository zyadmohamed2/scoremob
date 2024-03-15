import 'dart:convert';

import 'package:scoremob/data/model/transfers_response/player.dart';
import 'package:scoremob/data/model/transfers_response/transfer.dart';

class PlayerTransferDataDTO {
  final PlayerDTO? player;
  final String? update;
  final List<TransferDTO>? transfers;

  PlayerTransferDataDTO({
    this.player,
    this.update,
    this.transfers,
  });

  factory PlayerTransferDataDTO.fromRawJson(String str) =>
      PlayerTransferDataDTO.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlayerTransferDataDTO.fromJson(Map<String, dynamic> json) =>
      PlayerTransferDataDTO(
        player:
            json["player"] == null ? null : PlayerDTO.fromJson(json["player"]),
        update: json["update"],
        transfers: json["transfers"] == null
            ? []
            : List<TransferDTO>.from(
                json["transfers"]!.map((x) => TransferDTO.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "player": player?.toJson(),
        "update": update,
        "transfers": transfers == null
            ? []
            : List<dynamic>.from(transfers!.map((x) => x.toJson())),
      };
}
