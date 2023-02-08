import 'package:flutter/material.dart';

class TemperatureScale extends StatefulWidget {
  final int temperature;
  final bool defaultScale;
  TemperatureScale({required this.temperature, required this.defaultScale});

  @override
  _TemperatureScaleState createState() => _TemperatureScaleState();
}

class _TemperatureScaleState extends State<TemperatureScale> {
  Widget celsiusFormat() {
    return Row(
      children: [
        Text(
          widget.temperature.toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 70, color: Colors.white),
        ),
        Column(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '\u00b0',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white),
            ),
            Text(
              'C',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }

  int convertToFahrenheit() {
    return ((widget.temperature * 1.8) + 32).toInt();
  }

  Widget fahrenheitFormat() {
    return Row(
      children: [
        Text(
          convertToFahrenheit().toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 70, color: Colors.white),
        ),
        Column(
          children: [
            Text(
              '\u00b0',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.white),
            ),
            Text(
              'F',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.defaultScale ? celsiusFormat() : fahrenheitFormat();
  }
}
