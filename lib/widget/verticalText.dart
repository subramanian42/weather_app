import 'package:flutter/material.dart';

class MyVerticalText extends StatelessWidget {
  final String text;

  const MyVerticalText(this.text);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      //runSpacing: 30,
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      children: text
          .split("")
          .map((string) => Text(string, style: TextStyle(fontSize: 18)))
          .toList(),
    );
  }
}
