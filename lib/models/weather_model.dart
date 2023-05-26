class Weather {
  // final LocationModel location;
  // final CurrentModel current;

  final double temperatureC;
  final double temperatureF;
  final String conditionText;
  final String conditionIcon;
  final String locationName;
  final double windSpeed;
  final int windDegree;
  final double feelsLikeC;
  final double feelsLikeF;
  final double minTempC;
  final double minTempF;
  final double maxTempC;
  final double maxTempF;
  final int chanceOfRain;

  Weather({
    required this.temperatureC,
    required this.temperatureF,
    required this.conditionText,
    required this.conditionIcon,
    required this.locationName,
    required this.windSpeed,
    required this.windDegree,
    required this.feelsLikeC,
    required this.feelsLikeF,
    required this.minTempC,
    required this.minTempF,
    required this.maxTempC,
    required this.maxTempF,
    required this.chanceOfRain,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    // Map current = json['current'];

    return Weather(
      temperatureC: json['current']['temp_c'],
      temperatureF: json['current']['temp_f'],
      conditionText: json['current']['condition']['text'],
      conditionIcon: json['current']['condition']['icon'],
      locationName: json['location']['name'],
      windSpeed: json['current']['wind_mph'],
      windDegree: json['current']['wind_degree'],
      feelsLikeC: json['current']['feelslike_c'],
      feelsLikeF: json['current']['feelslike_f'],
      minTempC: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      minTempF: json['forecast']['forecastday'][0]['day']['mintemp_f'],
      maxTempC: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      maxTempF: json['forecast']['forecastday'][0]['day']['maxtemp_f'],
      chanceOfRain: json['forecast']['forecastday'][0]['day']
          ['daily_chance_of_rain'],
    );
  }
}


// class LocationModel {

// }

// class CurrentModel {

// }