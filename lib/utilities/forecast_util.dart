import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM d, y').format(dateTime);
  }

  static getItem(IconData iconData, int value, String units) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 28,
          color: Colors.white,
        ),
        SizedBox(height: 10.0),
        Text(
          '$value',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        Text(
          '$units',
          style: TextStyle(fontSize: 15, color: Colors.white),
        )
      ],
    );
  }
}
