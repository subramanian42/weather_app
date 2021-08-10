import 'package:flutter/material.dart';
import 'package:weather_app/widget/temperatureScale.dart';
import 'package:weather_app/widget/verticalText.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Align(
                alignment: Alignment(0.00, 0.00),
                child: Container(
                  height: 75,
                  width: 150,
                  child: TemperatureScale(
                    temperature: 100,
                    defaultScale: true,
                  ),
                ),
              ),
/*             SizedBox(
                height: 50,
              ), */
              /* Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/sunny.jpg',
                    width: 300,
                    height: 300,
                  ),
                  MyVerticalText('SUNNY'),
                ],
              ), */
            ],
          ),
        ),
      ),
    );
  }
}

/* Center(
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwmYc9fXBFPKbZC_DQ9K_vYtfNLxPs01Fs8A&usqp=CAU',
                         
                        ),
                      ), */



/// previously used code 
/* 
Container(
        color: Colors.yellow,
        height: 75,
        width: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '100',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 70,
              ),
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
        ),
      ), */