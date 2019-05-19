import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_weather/weather_bloc/weather_event.dart';
import 'package:flutter_weather/weather_bloc/weather_state.dart';
import 'package:flutter_weather/repository/weather_repository.dart';
import 'package:flutter_weather/model/weather_model.dart';

// Convert events to states
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({this.weatherRepository}) : assert(weatherRepository != null);

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(
      WeatherState currentState, WeatherEvent event) async* {
    if (event is FetchWeather) {
      yield WeatherLoading();
      try {
        final Weather weather = await weatherRepository.getWeather(event.city);
        yield WeatherLoaded(weather);
      } catch (_) {
        yield WeatherError();
      }
    }
  }
}
