import 'package:get/get.dart';
import 'package:to_do_list/models/weather_model.dart';
import 'package:to_do_list/services/weather_api.dart';

class WeatherCurrent extends GetxController {
  WeatherApi weatherApi = WeatherApi();
  SearchApi searchApi = SearchApi();

  double temperatureC = 0.0;
  double temperatureF = 0.0;
  String conditionText = "";
  String conditionIcon = "";
  String locationName = "";
  double windSpeed = 0.0;
  int windDegree = 0;
  double feelsLikeC = 0.0;
  double feelsLikeF = 0.0;
  double minTempC = 0.0;
  double minTempF = 0.0;
  double maxTempC = 0.0;
  double maxTempF = 0.0;
  int chanceOfRain = 0;

  bool isLoading = true;
  String error = '';
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getSelectedString(String search) async {
    isLoading = true;
    error = '';
    update();
    getWeatherData(search).then((value) {
      isLoading = false;
      update();
    }).catchError((onError) {
      isLoading = false;
      error = onError.toString();
      update();
    });
  }

  void getData() {
    isLoading = true;
    error = '';
    update();

    getWeatherData('Phnum Penh').then((value) {
      isLoading = false;
      update();
    }).catchError((onError) {
      isLoading = false;
      error = onError.toString();
      update();
    });
  }

  // void test(String search) async {
  //   SearchApi searchApi = SearchApi();
  //   print(search);
  // }

  Future<void> getWeatherData(String place) async {
    // await Future.delayed(const Duration(seconds: 3));
    Weather weather = await weatherApi.getWeather(place);
    temperatureC = weather.temperatureC;
    temperatureF = weather.temperatureF;
    conditionText = weather.conditionText;
    conditionIcon = weather.conditionIcon;
    locationName = weather.locationName;
    windSpeed = weather.windSpeed;
    windDegree = weather.windDegree;
    feelsLikeC = weather.feelsLikeC;
    feelsLikeF = weather.feelsLikeF;
    minTempC = weather.minTempC;
    minTempF = weather.minTempF;
    maxTempC = weather.maxTempC;
    maxTempF = weather.maxTempF;
    chanceOfRain = weather.chanceOfRain;
  }

  // void getWeatherData2(String place) async {
  //   try {
  //     isLoading = true;
  //     error = '';
  //     update();

  //     await Future.delayed(const Duration(seconds: 3));
  //     Weather weather = await weatherApi.getWeather(place);
  //     temperatureC = weather.temperatureC;
  //     temperatureF = weather.temperatureF;
  //     conditionText = weather.conditionText;
  //     conditionIcon = weather.conditionIcon;
  //     locationName = weather.locationName;
  //     windSpeed = weather.windSpeed;
  //     windDegree = weather.windDegree;
  //     feelsLikeC = weather.feelsLikeC;
  //     feelsLikeF = weather.feelsLikeF;

  //     isLoading = false;
  //     update();
  //   } catch (onError) {
  //     isLoading = false;
  //     error = onError.toString();
  //     update();
  //   }
  // }
}
