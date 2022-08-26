import 'package:flutter/material.dart';
import 'package:weather/src/models/weather_daily.dart';
import 'package:weather/src/widgets/forecast_card.dart';

class ButtonListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const ButtonListView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '7-Day Weather Forecast'.toUpperCase(),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Container(
          height: 140,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: ListView.separated(
            itemBuilder: (context, index) => Card(
              shape: border,
              color: Colors.black12,
              child: forecastCard(snapshot, index),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemCount: snapshot.data!.list!.length,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
