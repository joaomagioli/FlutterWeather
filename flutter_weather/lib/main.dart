import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather/repository/weather_api_client.dart';
import 'package:flutter_weather/repository/weather_repository.dart';
import 'simple_bloc_delegate.dart';
import 'package:http/http.dart' as http;

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();

  final WeatherApiClient weatherApiClient = WeatherApiClient(http.Client());
  final WeatherRepository weatherRepository =
      WeatherRepository(weatherApiClient);

  runApp(App(
    weatherRepository: weatherRepository,
  ));
}

class App extends StatelessWidget {
  final WeatherRepository weatherRepository;

  App({Key key, this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Container());
  }
}
