import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_application_2/model/weather_model.dart';

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(
    //lat Широта
    //lon Долгота
    double? lat,
    double? lon,
  ) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=c5ab3577eecfbf963ecd13514779dc27&units=metric");

    var resposne = await http.get(endpoint);
    var body = jsonDecode(resposne.body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}
