import 'dart:async';
import 'package:flutter_weather/repository/weather_api_client.dart';
import 'package:flutter_weather/model/weather_model.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository(this.weatherApiClient) : assert(weatherApiClient != null);

  Future<Weather> getWeather(String city) async {
    final weatherLocationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(weatherLocationId);
  }
}
