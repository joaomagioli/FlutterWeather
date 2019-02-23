import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_weather/model/weather_model.dart';

class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient;

  WeatherApiClient(this.httpClient) : assert(httpClient != null);

  /// Method that retrieves the id of a location.
  /// Return the first where on earth id
  Future<int> getLocationId(String city) async {
    final locationUrl = '$baseUrl/api/location/search/?query=$city';
    final locationResponse = await this.httpClient.get(locationUrl);

    if (locationResponse.statusCode != 200)
      throw Exception('error getting locationId for city');

    final locationJson = jsonDecode(locationResponse.body) as List;
    return locationJson.first['woeid'];
  }

  /// Method that retrieves current weather of the city id
  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = '$baseUrl/api/location/$locationId';
    final weatherResponse = await this.httpClient.get(weatherUrl);

    if (weatherResponse.statusCode != 200)
      throw Exception('error getting weather for location');

    final weatherJson = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherJson);
  }
}
