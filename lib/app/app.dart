import 'package:connection_notifier/connection_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoremob/repo/main_repo/main_repo.dart';
import 'package:scoremob/view/shared/no_glow_behavior.dart';
import 'package:scoremob/view/theme/theme.dart';

import '../view/page_home/home_page.dart';
import '../view/res/strings.dart';

class App extends StatelessWidget {
  const App({required this.mainRepo, super.key});

  final MainRepo mainRepo;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: mainRepo,
      child: const AppView(),
    );
  }
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    const appTheme = AppTheme();
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        builder: (BuildContext context, Widget? widget) {
          return ConnectionNotifier(
            child: MaterialApp(
              title: resStrAppTitle,
              theme: appTheme.toThemeData(),
              themeMode: ThemeMode.system,
              home: ScrollConfiguration(
                behavior: NoGlowScrollBehavior(),
                child: const HomePage(),
              ),
              navigatorObservers: [routeObserver],
            ),
          );
        });
  }
}
