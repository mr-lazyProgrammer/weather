import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/common/provider/dio_provider.dart';
import 'package:weather/features/search_city/data/model/city_search_result.dart';
import 'package:weather/features/search_city/data/service/city_search_service.dart';
import 'package:weather/features/search_city/providers/state/city_search_state.dart';
import 'package:dio/dio.dart';

class CitySearchNotifier extends Notifier{
  CitySearchState citySearchState = CitySearchLoading();
  @override
  build() {
    // TODO: implement build
    throw UnimplementedError();
  }
  late final Dio _dio = ref.read(dioProvider);
  late final CitySearchService _searchService = CitySearchService(_dio);

  Future<void> searchCity({required String name}) async{
    citySearchState = CitySearchLoading();
    CitySearchResult _citySearchResult = await _searchService.searchCity(name: name, count: 10, language: "en", format: "json")
  }

}