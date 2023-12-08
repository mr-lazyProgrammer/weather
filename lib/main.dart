
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:weather/common/const/rooute_list.dart';
import 'package:weather/features/theme/weather_theme/weather_theme_provider.dart';
import 'package:weather/features/theme/weather_theme/weather_theme_state.dart';

import 'features/current_weather/ui/widget/navigation_widget.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(routes: [
    StatefulShellRoute.indexedStack(
        builder: (context, state,StatefulNavigationShell shell) {
          return NavigationWidget(shell: shell,);
        },
        branches:  RouteList.routeList)
  ]);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WeatherThemeState weatherThemeState = ref.watch(themeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: weatherThemeState.themeData(),
      routerConfig: _router,
    );
  }
}
