import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:scoremob/view/page_match/model/player_model/player_model.dart';

class PlayerCard extends StatelessWidget {
  const PlayerCard({super.key, required this.playerResponse});
  final PlayerModel playerResponse;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.45,
      decoration: BoxDecoration(
          color: Colors.pink, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(15),
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(playerResponse.response![0].player!.photo!), fit: BoxFit.fill)
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: NetworkImage(playerResponse.response![0].statistics![0].team!.logo!), fit: BoxFit.fill)
                ),
              ),
            ],
          ),
          Text(playerResponse.response![0].player!.name!, style: TextStyle(color: Colors.white, fontSize: 16),),
          Row(
            children: [
              Gap(10),
              Container(
                width: 60,
                height: 28,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: Colors.black54,
                  border: Border.all(color: Colors.white)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/icons/ball_small.png", color: Colors.white,),
                    Text((playerResponse.response![0].statistics![0].goals!.total??"-").toString(), style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
              Gap(10),
            ],
          )
        ],
      ),
    );
  }
}
