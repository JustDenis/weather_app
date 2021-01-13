import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/widgets/city_view.dart';
import 'package:weather_app/widgets/temp_view.dart';
import 'package:weather_app/widgets/detail_view.dart';
import 'package:weather_app/widgets/bottom_list_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;
  WeatherForecastScreen({this.locationWeather});
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WeatherForecast',
          style: TextStyle(fontSize: 24),
        ),
        leading: IconButton(
          icon: Icon(Icons.my_location),
          iconSize: 28,
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () async {
              var tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return CityScreen();
              }));
              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(city: _cityName, isCity: true);
                });
              }
            },
            iconSize: 28,
          )
        ],
        centerTitle: true,
        backgroundColor: Color(0xff006270),
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 50.0,
                      ),
                      CityView(
                        snapshot: snapshot,
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      TempView(
                        snapshot: snapshot,
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      DetailView(
                        snapshot: snapshot,
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      BottomListView(
                        snapshot: snapshot,
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text(
                      'City not found\nPlease, enter correct city',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
      backgroundColor: Color(0xff009394),
    );
  }
}
