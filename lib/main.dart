import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoremob/app/app.dart';
import 'package:scoremob/app/app_bloc_observer.dart';
import 'package:scoremob/repo/fixtures_repo/fixtures_repo_impl.dart';
import 'package:scoremob/repo/leagues_repo/leagues_repo_impl.dart';
import 'package:scoremob/repo/main_repo/main_repo.dart';
import 'package:scoremob/repo/teams_repo/teams_repo_impl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();
  final mainRepo = MainRepo(
      fixturesRepo: FixturesRepoImpl(),
      leaguesRepo: LeaguesRepoImpl(),
      teamsRepo: TeamsRepoImpl());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(App(mainRepo: mainRepo)));
}
