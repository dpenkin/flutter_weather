// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:weather/src/models/weather_daily.dart';
import 'package:weather/src/utilites/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var timeList = snapshot.data!.list![0].dt;
    var city = snapshot.data!.city!.name;
    var country = snapshot.data!.city!.country;
    var formatedDate =
        DateTime.fromMillisecondsSinceEpoch(timeList! * 1000);
    return Column(
      children: <Widget>[
        Text(
          '$city, $country',
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28.0),
        ),
        Text(
          Util.getFormatedDate(formatedDate),
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15.0),
        )
      ],
    );
  }
}
