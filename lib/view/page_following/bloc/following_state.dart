part of 'following_bloc.dart';

sealed class FollowingState {}

final class FollowingInitial extends FollowingState {}

class SuccessGetFollowingPlayer extends FollowingState{}
