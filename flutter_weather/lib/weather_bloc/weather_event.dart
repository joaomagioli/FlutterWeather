import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  WeatherEvent([List props = const []]) : super(props);
}

class FetchWeather extends WeatherEvent {
  final String city;

  // Always we receive a city, we will dispatch an event
  // The bloc is responsible for getting this event and sending back a state
  FetchWeather(this.city)
      : assert(city != null),
        super([city]);
}
