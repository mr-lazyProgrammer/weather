import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather/features/search_city/data/model/city_search_result.dart';
import 'package:weather/features/search_city/ui/widget/flag_icon.dart';

class CityList extends StatelessWidget {
  const CityList({super.key, required this.citySearchResult});

  final CitySearchResult citySearchResult;

  @override
  Widget build(BuildContext context) {
    List<Results>? city = citySearchResult.results;
    return ListView.builder(
        itemCount: city?.length ?? 0,
        itemBuilder: (context, position) {
          Results? result = city?[position];
          return InkWell(
            onTap: () {
              if(kIsWeb) {
                context.go('/current/${result?.latitude}/${result?.longitude}/${result?.name}');
              }else{
                context.push('/current/${result?.latitude}/${result?.longitude}/${result?.name}');
              }
            },
            child: Card(
              elevation: 5.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(result?.name ?? ''),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(result?.country ?? ''),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: flagIcon(result?.countryCode ?? ''),
                      width: 54,
                      height: 54,
                      progressIndicatorBuilder: (_, __, ___) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (_, __, ___) =>
                          const Center(child: Icon(Icons.error)),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
