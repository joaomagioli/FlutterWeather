import 'package:equatable/equatable.dart';
import 'package:flutter_weather/model/weather_condition.dart';

class Weather extends Equatable {
  final WeatherCondition weatherCondition;
  final String formattedCondition;
  final double minimumTemperature;
  final double maximumTemperature;
  final double temperature;
  final int locationId;
  final String created;
  final DateTime lastUpdated;
  final String location;

  Weather(
      {this.weatherCondition,
      this.formattedCondition,
      this.minimumTemperature,
      this.maximumTemperature,
      this.temperature,
      this.locationId,
      this.created,
      this.lastUpdated,
      this.location});

  static Weather fromJson(dynamic json) {
    final consolidatedWeather = json['consolidated_weather'];
    return Weather(
        weatherCondition: _mapStringToWeatherCondition(
            consolidatedWeather['weather_state_abbr']),
        formattedCondition: consolidatedWeather['weather_state_name'],
        minimumTemperature: consolidatedWeather['min_temp'] as double,
        maximumTemperature: consolidatedWeather['max_temp'] as double,
        temperature: consolidatedWeather['the_temp'] as double,
        locationId: consolidatedWeather['woeid'] as int,
        created: consolidatedWeather['created'],
        lastUpdated: DateTime.now(),
        location: consolidatedWeather['title']);
  }

  static WeatherCondition _mapStringToWeatherCondition(String input) {
    WeatherCondition state;
    switch (input) {
      case 'sn':
        state = WeatherCondition.snow;
        break;
      case 'sl':
        state = WeatherCondition.sleet;
        break;
      case 'h':
        state = WeatherCondition.hail;
        break;
      case 't':
        state = WeatherCondition.thunderstorm;
        break;
      case 'hr':
        state = WeatherCondition.heavyRain;
        break;
      case 'lr':
        state = WeatherCondition.lightRain;
        break;
      case 's':
        state = WeatherCondition.showers;
        break;
      case 'hc':
        state = WeatherCondition.heavyCloud;
        break;
      case 'lc':
        state = WeatherCondition.lightCloud;
        break;
      case 'c':
        state = WeatherCondition.clear;
        break;
      default:
        state = WeatherCondition.unknown;
    }
    return state;
  }
}
