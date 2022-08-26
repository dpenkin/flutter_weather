import 'package:flutter/material.dart';
import 'package:weather/src/api/weather_api.dart';
import 'package:weather/src/models/weather_daily.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather/src/widgets/background_image.dart';
import 'package:weather/src/widgets/button_list_view.dart';
import 'package:weather/src/widgets/city.dart';
import 'package:weather/src/widgets/detail_view.dart';
import 'package:weather/src/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  State<WeatherForecastScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = 'Amsterdam';

  @override
  void initState() {
    super.initState();
    forecastObject = WeatherApi().fetchWeatherForcastCity(cityName: _cityName);
  }

  void _findCity() {
    setState(() {
      forecastObject =
          WeatherApi().fetchWeatherForcastCity(cityName: _cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const BackgroundImage(),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text('Weather'),
              leading: IconButton(
                icon: const Icon(Icons.my_location),
                onPressed: () {},
              ),
            ),
            body: ListView(
              children: <Widget>[
                FutureBuilder<WeatherForecast>(
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                              child: TextField(
                                cursorColor: Colors.white,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: _findCity,
                                    icon: const Icon(
                                      Icons.location_city,
                                      color: Colors.white,
                                    ),
                                  ),
                                  hintText: 'Enter City Name',
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  filled: true,
                                  fillColor: Colors.black38,
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.0),
                                      ),
                                      borderSide: BorderSide.none),
                                ),
                                onChanged: (value) {
                                  _cityName = value;
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            CityView(snapshot: snapshot),
                            // const SizedBox(height: 20),
                            TempView(snapshot: snapshot),
                            // const SizedBox(height: 30),
                            DetailView(snapshot: snapshot),
                            const SizedBox(height: 50),
                            ButtonListView(snapshot: snapshot),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: SpinKitDoubleBounce(
                          color: Colors.black,
                        ),
                      );
                    }
                  }),
                  future: forecastObject,
                )
              ],
            ))
      ],
    );
  }
}
