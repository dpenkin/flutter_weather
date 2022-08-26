// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:weather/src/models/weather_daily.dart';
import 'package:lottie/lottie.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const TempView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forescastList = snapshot.data!.list;
    var icon = forescastList![0].getIconUrl();

    var temp = forescastList[0].temp!.day?.toStringAsFixed(0);
    var description = forescastList[0].weather![0].description;
    var typeIcon = forescastList[0].weather![0].main;

    final WidgetIconSunny = typeIcon == 'Clear'
        ? Lottie.asset('assets/sunny.json', height: 150, width: 150)
        : Image.network(icon, scale: 0.6);
    final WidgetIconSunnySnow = typeIcon == 'Snow'
        ? Lottie.asset('assets/weather.json', height: 150, width: 150)
        : WidgetIconSunny;
    final WidgetIconClouds = typeIcon == 'Clouds'
        ? Lottie.asset('assets/cloud.json', height: 150, width: 150)
        : WidgetIconSunnySnow;
    final WidgetIcon = typeIcon == 'Rain'
        ? Lottie.asset('assets/rainingIcon.json', height: 150, width: 150)
        : WidgetIconClouds;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        WidgetIcon,
        const SizedBox(
          height: 50,
          width: 20,
        ),
        Column(
          children: <Widget>[
            Text(
              '$temp °C',
              style: const TextStyle(
                  fontSize: 54,
                  color: Colors.white,
                  fontFamily: 'LowballBoldDisplayOpt72'),
            ),
            Text(
              '$description',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
