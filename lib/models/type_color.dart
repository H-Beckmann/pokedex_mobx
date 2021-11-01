import 'package:flutter/material.dart';

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

String getColor(String color) {
  if (color == "normal") {
    return "#A8A77A";
  }
  if (color == "fighting") {
    return "#C22E28";
  }
  if (color == "flying") {
    return "#A98FF3";
  }
  if (color == "poison") {
    return "#A33EA1";
  }
  if (color == "ground") {
    return "#E2BF65";
  }
  if (color == "rock") {
    return "#B6A136";
  }
  if (color == "bug") {
    return "#A6B91A";
  }
  if (color == "ghost") {
    return "#735797";
  }
  if (color == "steel") {
    return "#B7B7CE";
  }
  if (color == "fire") {
    return "#EE8130";
  }
  if (color == "water") {
    return "#6390F0";
  }
  if (color == "grass") {
    return "#7AC74C";
  }
  if (color == "electric") {
    return "#F7D02C";
  }
  if (color == "psychic") {
    return "#F95587";
  }
  if (color == "ice") {
    return "#96D9D6";
  }
  if (color == "dragon") {
    return "#6F35FC";
  }
  if (color == "dark") {
    return "#705746";
  }
  if (color == "fairy") {
    return "#D685AD";
  }
  return "#FFFFFF";
}
