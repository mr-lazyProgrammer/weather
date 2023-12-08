import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/features/search_city/data/model/city_search_result.dart';
import 'package:weather/features/search_city/providers/city_search_notifier.dart';
import 'package:weather/features/search_city/providers/state/city_search_state.dart';
import 'package:weather/features/search_city/ui/widget/city_list_widget.dart';
import 'package:weather/features/theme/weather_theme/weather_theme_provider.dart';
import 'package:weather/features/theme/weather_theme/weather_theme_state.dart';

class CitySearchScreen extends ConsumerStatefulWidget {
  const CitySearchScreen({super.key});

  @override
  ConsumerState<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends ConsumerState<CitySearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CitySearchState citySearchState = ref.watch(citySearchProvider);
    CitySearchNotifier provider = ref.read(citySearchProvider.notifier);
    WeatherThemeState themeState = ref.watch(themeProvider);
    WeatherThemeNotifier themeNotifier = ref.read(themeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        centerTitle: true,
        actions: [
          Switch(value: (themeState is WeatherDarkTheme), onChanged: (value){
            if(value){
              themeNotifier.changeTheme(WeatherDarkTheme());
            }else{
              themeNotifier.changeTheme(WeatherLightTheme());
            }
          })
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (str){
                if(str.isNotEmpty){
                  provider.searchCity(name: str);
                }
              },
                controller: _textEditingController,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Search City",
                    suffixIcon: IconButton(
                        onPressed: () {
                          String city = _textEditingController.text.trim();
                          if (city.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Please Enter Completely')));
                          } else {
                            provider.searchCity(name: city);
                          }
                        },
                        icon: const Icon(Icons.search)))),
          ),
          Expanded(child: _citySearchResultWidget(citySearchState))
        ],
      ),
    );
  }

  Widget _citySearchResultWidget(CitySearchState citySearchState) {
    return Center(
      child: switch (citySearchState) {
        CitySearchForm() => const Text('Please Search A City'),
        CitySearchLoading() => const CircularProgressIndicator(),
        CitySearchSuccess(
          citySearchResult: CitySearchResult citySearchResult
        ) =>
          CityList(
            citySearchResult: citySearchResult,
          ),
        CitySearchFiled(errorMessage: String errorMessage) =>
          const Text('Something Wrong')
      },
    );
  }
}
