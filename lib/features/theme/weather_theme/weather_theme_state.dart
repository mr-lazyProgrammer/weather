import 'package:flutter/material.dart';

sealed class WeatherThemeState{
  ThemeData themeData();
}

class WeatherLightTheme extends WeatherThemeState{
  @override
  ThemeData themeData() {
    return ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(backgroundColor: Colors.indigo),
      navigationRailTheme: const NavigationRailThemeData(
        unselectedLabelTextStyle: TextStyle(color: Colors.indigo),
        selectedLabelTextStyle: TextStyle(color: Colors.indigo,fontSize: 16),
        unselectedIconTheme: IconThemeData(color: Colors.indigo),
        selectedIconTheme: IconThemeData(color: Colors.indigo,size: 30)
      )
    );
  }

}

class WeatherDarkTheme extends WeatherThemeState{
  @override
  ThemeData themeData() {
    return ThemeData.dark().copyWith(
      navigationRailTheme: const NavigationRailThemeData(
          unselectedLabelTextStyle: TextStyle(color: Colors.grey),
          selectedLabelTextStyle: TextStyle(color: Colors.white,fontSize: 16),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          selectedIconTheme: IconThemeData(color: Colors.white,size: 30)
      )
    );
  }

}