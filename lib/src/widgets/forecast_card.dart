// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:weather/src/utilites/forecast_util.dart';
import 'package:lottie/lottie.dart';

Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormatedDate(date);
  dayOfWeek = fullDate.split(',')[0].substring(0, 3);
  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);
  var icon = forecastList[index].getIconUrl();

  var typeIcon = forecastList[index].weather![0].main;

    final WidgetIconSunny = typeIcon == 'Clear'
        ? Lottie.asset('assets/sunny.json', height: 50, width: 50)
        : Image.network(icon, scale: 0.6);
    final WidgetIconSunnySnow = typeIcon == 'Snow'
        ? Lottie.asset('assets/weather.json', height: 50, width: 50)
        : WidgetIconSunny;
    final WidgetIconClouds = typeIcon == 'Clouds'
        ? Lottie.asset('assets/cloud.json', height: 50, width: 50)
        : WidgetIconSunnySnow;
    final WidgetIcon = typeIcon == 'Rain'
        ? Lottie.asset('assets/rainingIcon.json', height: 50, width: 50)
        : WidgetIconClouds;

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '$tempMin °C',
                      style: const TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  WidgetIcon,
                  // Image.network(icon, scale: 1.2, color: Colors.white),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
