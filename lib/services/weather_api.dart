import 'package:get/get.dart';
import 'package:to_do_list/models/search_model.dart';
import 'package:to_do_list/models/weather_model.dart';
import 'dart:convert';

class WeatherApi extends GetConnect {
  final key = "c78444acdb544c3fb7914351231605";
  Future<Weather> getWeather(String place) async {
    final response = await get(
        'https://api.weatherapi.com/v1/forecast.json?key=${key}&q=${place}&days=3&aqi=no&alerts=no');
    // print(response.body);
    if (response.statusCode == 200) {
      return Weather.fromJson(response.body);
    } else {
      throw Exception(response.statusText);
    }
  }
}

class SearchApi extends GetConnect {
  final key = 'c78444acdb544c3fb7914351231605';
  Future<List<SearchModel>> getSearch(String? search) async {
    try {
      final response = await get(
          'https://api.weatherapi.com/v1/search.json?key=${key}&q=${search}');
      // print(response.body);
      if (response.statusCode == 200) {
        return SearchModel.fromJsonList(response.body);
      } else {
        throw Exception(response.statusText);
      }
    } catch (ex) {
      // print('error: $ex');
      rethrow;
    }
  }
}
