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
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.temperature.toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 70, color: Colors.black),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '\u00b0',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black),
            ),
            Text(
              'C',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
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
              fontWeight: FontWeight.bold, fontSize: 70, color: Colors.black),
        ),
        Column(
          children: [
            Text(
              '\u00b0',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'F',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
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
