import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/common/provider/dio_provider.dart';
import 'package:weather/features/current_weather/data/model/current_weather_result.dart';
import 'package:weather/features/current_weather/data/service/current_weather_service.dart';
import 'package:weather/features/current_weather/provider/state/current_weather_state.dart';
import 'package:dio/dio.dart';

class CurrentWeatherNotifier extends Notifier<CurrentWeatherState> {
  final CurrentWeatherState _currentWeatherState = CurrentWeatherLoading();

  @override
  build() {
    return _currentWeatherState;
  }

  late final Dio dio = ref.read(dioProvider);
  late final CurrentWeatherService currentWeatherService =
      CurrentWeatherService(dio);

  void getWeather({required String latitude, required String longitude}) async {
    try {
      state = CurrentWeatherLoading();
      CurrentWeatherResult currentWeatherResult =
          await currentWeatherService.getCurrentWeather(
              latitude: latitude, longitude: longitude, currentWeather: true);
      state = CurrentWeatherSuccess(currentWeatherResult);
    } catch (e) {
      state = CurrentWeatherFailed("Something Wrong");
    }
  }
}

final currentWeatherNotifier =
    NotifierProvider<CurrentWeatherNotifier, CurrentWeatherState>(() {
  return CurrentWeatherNotifier();
});
