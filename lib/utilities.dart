import 'package:flutter/material.dart';

Color color(String time) {
  var color = Colors.black;

  if (time == "today") {
    color = Colors.blue;
  } else if (time == "Yesterday") {
    color = Colors.pink;
  } else {
    color = Colors.grey;
  }
  return color;
}
