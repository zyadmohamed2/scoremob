import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scoremob/repo/following/following_repo.dart';

part 'following_event.dart';
part 'following_state.dart';

class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  FollowingRepo followingRepo;
  FollowingBloc(this.followingRepo) : super(FollowingInitial()) {
    on<GetFollowingPlayer>((event, emit) async {
      var ruselt = await followingRepo.getPlayerFollowing();
      emit(SuccessGetFollowingPlayer());
    });
  }
}
