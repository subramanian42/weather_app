import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/class/weather.dart';
import 'package:weather_app/pages/blocProvider.dart';
//import 'package:rive/rive.dart';
import 'package:weather_app/widget/temperatureScale.dart';
import 'package:weather_app/widget/verticalText.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _citynamecontroller = TextEditingController();
  Future<Weather> fetchWeather(String cityname) async {
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=${user.apikey}'));
    //http.get(Uri.http("10.0.2.2:3000", "products", {"categoryId" : "$categoryId"}  ))
    if (response.statusCode == 200) {
      print('SUCCESS');
      // print(response.body);
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch weather');
    }
  }

  @override
  void initState() {
    super.initState();
    // futureWeather =fetchWeather(cityname);
  }

  @override
  void dispose() {
    _citynamecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.yellow[200],
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Align(
                  alignment: Alignment(-0.65, 0.00),
                  child: Container(
                    height: 75,
                    width: 150,
                    child: TemperatureScale(
                      temperature: 26,
                      defaultScale: false,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 200,
                    height: 40,
                    child: TextField(
                      controller: _citynamecontroller,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (String cityname) async {
                        Weather currentweather = await fetchWeather(cityname);
                        print('current weather variable ?');
                        print(currentweather.temperaturepressure);
                      },
                    ),
                  ),
                  Flexible(flex: 1, child: MyVerticalText('SUNNY')),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            elevation: 12.0,
            fixedColor: Colors.transparent,
            selectedItemColor: Color(0X000000),
            unselectedItemColor: Color(0X808080),
            currentIndex: user.index,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.wb_sunny), label: 'Now'),
              BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Tue'),
              BottomNavigationBarItem(icon: Icon(Icons.waves), label: 'Wed'),
              BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Thurs'),
              BottomNavigationBarItem(icon: Icon(Icons.water), label: 'Fri'),
              BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Sat'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.wb_sunny_rounded), label: 'Sun'),
            ]),
      ),
    );
  }
}
