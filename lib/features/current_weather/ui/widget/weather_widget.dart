import 'package:flutter/material.dart';
import 'package:weather/features/current_weather/data/model/current_weather_result.dart';
import 'package:weather/features/current_weather/ui/screen/current_weather_screen.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.widget,
    required this.current,
  });

  final CurrentWeatherScreen widget;
  final CurrentWeatherResult current;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff5C6BC0),
            Color(0xff3949AB),
            Color(0xff283593),
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            widget.city,
            style: const TextStyle(
                fontSize: 34, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    '${current.currentWeather?.weathercode?.toCondition.toEmoji()}',
                    style: const TextStyle(fontSize: 30,color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text('${current.currentWeather?.weathercode?.toCondition}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white)),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    '${current.currentWeather?.temperature ?? ''} °C',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

extension on num {
  String get toCondition {
    switch (this) {
      case 0:
        return "Clear";
      case 1:
      case 2:
      case 3:
      case 45:
      case 48:
        return "Cloudy";
      case 51:
      case 53:
      case 55:
      case 56:
      case 57:
      case 61:
      case 63:
      case 65:
      case 66:
      case 67:
      case 80:
      case 81:
      case 82:
      case 95:
      case 96:
      case 99:
        return "Rainy";
      case 71:
      case 73:
      case 75:
      case 77:
      case 85:
      case 86:
        return "Snowy";
      default:
        return "Unknown";
    }
  }
}

extension on String {
  String toEmoji() {
    switch (this) {
      case "Clear":
        return '☀️';
      case "Cloudy":
        return '🌧️';
      case "Rainy":
        return '☁️';
      case "Snowy":
        return '🌨️';
      default:
        return '❓';
    }
  }
}