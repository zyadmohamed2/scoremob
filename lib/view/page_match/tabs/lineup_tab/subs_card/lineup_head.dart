import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/config.dart';
import 'package:scoremob/data/api/api_client.dart';
import 'package:scoremob/data/model/players_response/player.dart';
import 'package:scoremob/view/page_home/widgets/bottom_nav_bar.dart';
import 'package:scoremob/view/page_match/model/lineup.dart';
import 'package:scoremob/view/page_match/model/player_model/player_model.dart';
import 'package:scoremob/view/shared/widget/player_head.dart';
import 'package:scoremob/view/shared/widget/player_head_labeled.dart';

import '../../../model/lineup_player.dart';

class LineupHead extends StatelessWidget {
  LineupHead(
      {required this.player,
      required this.photo,
      this.injured,
      this.subsIn,
      this.rating,
      super.key});

  LineupPlayer player;
  String photo;
  bool? injured;
  bool? subsIn;
  double? rating;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        ApiClient apiClient = ApiClient();
        var response =
            await apiClient.getPlayer(id: "${player.id}", season: DateTime.now().year.toString());
        PlayerModel playerResponse = PlayerModel.fromJson(response);
        // ignore: use_build_context_synchronously
        showBottomSheet(
          context: context,
          builder: (context) {
            if (playerResponse.response != null) {
              return PlayerInfoButtomSheet(playerResponse: playerResponse);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );

        // print(response.firstname);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PlayerHeadLabeled(
            url: photo,
            size: 46,
            injured: injured,
            substitutedIn: subsIn,
            rating: (rating == 0) ? null : rating,
          ),
          Gap(4.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                player.number.toString(),
                style: TextStyle(fontSize: 9.sp, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              Gap(4.w),
              Text(player.name,
                  style: TextStyle(fontSize: 9.sp),
                  textAlign: TextAlign.center),
            ],
          ),
          Text(player.getPositionTitle(),
              style: TextStyle(fontSize: 8.sp, color: Colors.grey.shade700),
              textAlign: TextAlign.center),
          Gap(12.h),
        ],
      ),
    );
  }
}

class PlayerInfoButtomSheet extends StatelessWidget {
  const PlayerInfoButtomSheet({super.key, required this.playerResponse});
  final PlayerModel playerResponse;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.90,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  image: DecorationImage(
                      image: NetworkImage(
                          playerResponse.response![0].player!.photo!)),
                ),
              ),
              Text(playerResponse.response![0].player!.name!,
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              const Gap(
                20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Info(
                      title: playerResponse
                          .response![0].statistics![0].games!.position!
                          .toString(),
                      subTitle: "Position"),
                  Info(
                      title: playerResponse.response![0].player!.birth!.country!
                          .toString(),
                      subTitle: "Country"),
                  Info(
                      title:
                          playerResponse.response![0].player!.age!.toString(),
                      subTitle: "Age"),
                ],
              ),
              const Gap(30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Top State",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const Gap(20),
              TopStateRow(
                  title: "FotMob rating",
                  valu: (playerResponse
                              .response?[0].statistics?[0].games?.rating ??
                          0)
                      .toString()),
              TopStateRow(
                  title: "Minutes played",
                  valu: (playerResponse
                              .response![0].statistics![0].games!.minutes ??
                          0)
                      .toString()),
              TopStateRow(
                  title: "Goals",
                  valu: (playerResponse
                              .response![0].statistics![0].goals!.total ??
                          0)
                      .toString()),
              TopStateRow(
                  title: "Assists",
                  valu: (playerResponse
                              .response![0].statistics![0].goals!.assists ??
                          0)
                      .toString()),
              TopStateRow(
                  title: "Accurate passes",
                  valu: (playerResponse
                              .response![0].statistics![0].shots!.total ??
                          0)
                      .toString()),
              TopStateRow(
                  title: "Total shots",
                  valu: (playerResponse
                              .response![0].statistics![0].games!.position ??
                          0)
                      .toString()),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Attack",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              TopStateRow(
                  title: "Successful dribbles",
                  valu: (playerResponse
                              .response![0].statistics![0].dribbles!.success ??
                          0)
                      .toString()),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Defense",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              TopStateRow(
                  title: "Tackles won",
                  valu: (playerResponse
                              .response![0].statistics![0].tackles!.total ??
                          0)
                      .toString()),
              TopStateRow(
                  title: "Dirbbled past",
                  valu: (playerResponse
                              .response![0].statistics![0].dribbles!.past ??
                          0)
                      .toString()),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Duels",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              TopStateRow(
                  title: "Ground duels won",
                  valu:
                      (playerResponse.response![0].statistics![0].duels!.won ??
                              0)
                          .toString()),
              TopStateRow(
                  title: "Aerial duels won",
                  valu:
                      (playerResponse.response![0].statistics![0].duels!.won ??
                              0)
                          .toString()),
              TopStateRow(
                  title: "Fouls committed",
                  valu: (playerResponse
                              .response![0].statistics![0].fouls!.committed ??
                          0)
                      .toString()),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
