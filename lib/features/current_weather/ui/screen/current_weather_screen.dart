import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/features/current_weather/data/model/current_weather_result.dart';
import 'package:weather/features/current_weather/provider/current_weather_notifier.dart';
import 'package:weather/features/current_weather/provider/state/current_weather_state.dart';

import '../widget/weather_widget.dart';

class CurrentWeatherScreen extends ConsumerStatefulWidget {
  const CurrentWeatherScreen(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.city});

  final String latitude;
  final String longitude;
  final String city;

  @override
  ConsumerState<CurrentWeatherScreen> createState() =>
      _CurrentWeatherScreenState();
}

class _CurrentWeatherScreenState extends ConsumerState<CurrentWeatherScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getWeather();
  }

  @override
  Widget build(BuildContext context) {
    final currentWeather = ref.watch(currentWeatherNotifier);
    return Scaffold(
      body: Stack(
        children: [
          _currentWeather(currentWeather),
          if(!kIsWeb)
          SafeArea(
            child: IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back)),
          ),
        ],
      ),
    );
  }

  void _getWeather() async {
    await Future.delayed(Duration.zero);
    ref
        .read(currentWeatherNotifier.notifier)
        .getWeather(latitude: widget.latitude, longitude: widget.longitude);
  }

  Widget _currentWeather(CurrentWeatherState currentWeatherState) {
    return switch (currentWeatherState) {
      CurrentWeatherLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
      CurrentWeatherSuccess(
        currentWeatherResult: CurrentWeatherResult current
      ) =>
        WeatherWidget(widget: widget, current: current),
      CurrentWeatherFailed(errorMessage: String error) => const Center(
          child: Text('Something Wrong'),
        )
    };
  }
}
