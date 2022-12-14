import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/src/models/weather_daily.dart';
import 'package:weather/src/utilites/constants.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForcastCity({String? cityName}) async {
    var queryParametrs = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName,
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_BASE_FORECAST_PATH, queryParametrs);

    var response = await http.get(uri);
    // print('response: ${response.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error');
    }
  }
}
