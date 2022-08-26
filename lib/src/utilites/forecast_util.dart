import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormatedDate(DateTime dateTime) {
    return DateFormat('EEEE, MMM d, y').format(dateTime);
  }

  static getItem(iconData, int value, String units) {
    return Column(
      children: [
        Icon(
          iconData,
          color: Colors.white,
          size: 28,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          '$value',
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        Text(
          units,
          style: const TextStyle(fontSize: 15, color: Colors.white),
        )
      ],
    );
  }
}
