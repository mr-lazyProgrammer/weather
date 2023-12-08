import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/features/theme/weather_theme/weather_theme_state.dart';

class WeatherThemeNotifier extends Notifier<WeatherThemeState>{

  final WeatherThemeState _weatherThemeState = WeatherLightTheme();
  @override
  WeatherThemeState build() {
   return _weatherThemeState;
  }

  void changeTheme(WeatherThemeState weatherThemeState){
    state = weatherThemeState;
  }

}

NotifierProvider<WeatherThemeNotifier,WeatherThemeState> themeProvider = NotifierProvider((){
  return WeatherThemeNotifier();
});