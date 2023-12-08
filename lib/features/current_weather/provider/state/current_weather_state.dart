import 'package:weather/features/current_weather/data/model/current_weather_result.dart';

sealed class CurrentWeatherState{}

class CurrentWeatherLoading extends CurrentWeatherState{}
class CurrentWeatherSuccess extends CurrentWeatherState{
  final CurrentWeatherResult currentWeatherResult;

  CurrentWeatherSuccess(this.currentWeatherResult);
}
class CurrentWeatherFailed extends CurrentWeatherState{
  final String errorMessage;

  CurrentWeatherFailed(this.errorMessage);
}