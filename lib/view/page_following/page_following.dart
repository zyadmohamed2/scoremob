import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoremob/data/api/api_client.dart';
import 'package:scoremob/view/page_following/bloc/following_bloc.dart';
import 'package:scoremob/view/page_following/widget/player_card.dart';
import 'package:scoremob/view/page_match/model/player_model/player_model.dart';

class PageFollowing extends StatefulWidget {
  const PageFollowing({super.key});

  @override
  State<PageFollowing> createState() => _PageFollowingState();
}

class _PageFollowingState extends State<PageFollowing> {
  ApiClient apiClient = ApiClient();
  PlayerModel? playerResponse;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FollowingBloc>(context).add(GetFollowingPlayer());
  }

  @override
  Widget build(BuildContext context) {
    if (playerResponse != null) {
      return BlocConsumer<FollowingBloc, FollowingState>(
        listener: (context, state) {
          if (state is SuccessGetFollowingPlayer) {
            
          }
        },
        builder: (context, state) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Following",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Row(
                        children: [
                          const Text(
                            "Edit",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add_circle_outline_sharp,
                                color: Colors.black,
                              ))
                        ],
                      )
                    ],
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  bottom: const PreferredSize(
                    preferredSize: Size.fromHeight(kToolbarHeight),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 200,
                        child: TabBar(
                          labelPadding: EdgeInsets.all(15),
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.black,
                          indicatorWeight: 3,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorPadding: EdgeInsets.all(0),
                          tabs: [
                            Text(
                              "Teams",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            Text(
                              "Player",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                    const TeamFollowingTap(),
                    PlayerFollowingTap(
                      playerResponse: playerResponse!,
                    )
                  ],
                )),
          );
        },
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

class TeamFollowingTap extends StatelessWidget {
  const TeamFollowingTap({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PlayerCard(
                  playerResponse: playerResponse,
                ),
                PlayerCard(
                  playerResponse: playerResponse,
                ),
                // PlayerCard(playerResponse: playerResponse,),
              ],
            ),
          )),
    );
  }
}

class PlayerFollowingTap extends StatelessWidget {
  const PlayerFollowingTap({super.key, required this.playerResponse});
  final PlayerModel playerResponse;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PlayerCard(
                playerResponse: playerResponse,
              ),
              PlayerCard(
                playerResponse: playerResponse,
              ),
              // PlayerCard(playerResponse: playerResponse,),
            ],
          ),
        ));
  }
}
