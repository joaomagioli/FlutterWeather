import 'package:equatable/equatable.dart';
import 'package:flutter_weather/model/weather_model.dart';

abstract class WeatherState extends Equatable {
  WeatherState([List props = const []]) : super(props);
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded(this.weather)
      : assert(weather != null),
        super([weather]);
}

class WeatherError extends WeatherState {}
