
import 'package:retrofit/http.dart';
import 'package:weather/common/const/api_const.dart';
import 'package:weather/features/current_weather/data/model/current_weather_result.dart';
import 'package:dio/dio.dart';

part 'current_weather_service.g.dart';
@RestApi(baseUrl: ApiConst.currentWeatherBaseUrl)
abstract class CurrentWeatherService{

  factory CurrentWeatherService(Dio dio) => _CurrentWeatherService(dio);

  @GET(ApiConst.forecastEndPoint)
  Future<CurrentWeatherResult> getCurrentWeather(
  {
    @Query('latitude') required String latitude,
    @Query('longitude') required String longitude,
    @Query('current_weather') required bool currentWeather
}
      );
}