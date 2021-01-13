import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    cursorColor: Colors.blueGrey[800],
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Enter a city name...',
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black87,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none),
                        icon: Icon(
                          Icons.location_city,
                          color: Colors.black87,
                          size: 50.0,
                        )),
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
              ),
              FlatButton(
                child: Text(
                  'Get Weather',
                  style: TextStyle(fontSize: 30.0),
                ),
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
