import 'package:to_do_list/models/weather_model.dart';

class SearchModel {
  int id;
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String url;

  SearchModel({
    required this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.url,
  });

  static List<SearchModel> fromJsonList(List<dynamic> json) {
    return (json)
        .map((e) => SearchModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json['id'],
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat'],
      lon: json['lon'],
      url: json['url'],
    );
  }
}
