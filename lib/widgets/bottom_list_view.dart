import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forecast_daily.dart';
import 'package:weather_app/widgets/forecast_card.dart';

class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const BottomListView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '7-Day Weather Forecast'.toUpperCase(),
          style: TextStyle(
              fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: 8,
            ),
            itemCount: snapshot.data.list.length,
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: 160,
              color: Color.fromRGBO(0, 98, 112, .5),
              child: forecastCard(snapshot, index),
            ),
          ),
        )
      ],
    );
  }
}
