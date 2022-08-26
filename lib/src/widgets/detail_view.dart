// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/src/models/weather_daily.dart';
import 'package:weather/src/utilites/forecast_util.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const DetailView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pressure = snapshot.data!.list![0].pressure! * 0.750062;
    var himidity = snapshot.data!.list![0].humidity;
    var wind = snapshot.data!.list![0].speed;
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Util.getItem(FontAwesomeIcons.thermometerThreeQuarters,
              pressure.round(), 'mm Hg'),
          Util.getItem(FontAwesomeIcons.cloudRain, himidity!, '%'),
          Util.getItem(FontAwesomeIcons.wind, wind!.toInt(), 'm/s')
        ]);
  }
}
