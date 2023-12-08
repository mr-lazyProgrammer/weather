import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/current_weather/ui/screen/current_weather_screen.dart';
import '../../features/search_city/ui/screen/city_search_screen.dart';
import '../../features/setting_screen/setting_screen.dart';

class RouteList{
  static final routeList = [
  StatefulShellBranch(routes: [
  GoRoute(
  path: '/',
  builder: (BuildContext context, GoRouterState state) {
  return const CitySearchScreen();
  },
  ),
  GoRoute(
  path: "/current/:lati/:longi/:city",
  builder: (context, routeState) {
  return CurrentWeatherScreen(
  latitude:  routeState.pathParameters['lati'] ?? '',
  longitude: routeState.pathParameters['longi'] ?? '',
  city: routeState.pathParameters['city'] ?? '',
  );
  })
  ]),
  StatefulShellBranch(routes: [
  GoRoute(
  path: '/setting',
  builder: (context,routeState){
  return const SettingScreen();
  })
  ])
  ];
}