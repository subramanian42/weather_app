import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/class/model.dart';
import 'package:weather_app/business/Weatherdetails.dart';
import 'package:rive/rive.dart';
import 'package:weather_app/presentation/widget/temperatureScale.dart';
import 'package:weather_app/presentation/widget/verticalText.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  late TextEditingController _citynamecontroller = TextEditingController();
  Future<Weather> fetchWeather(String cityname) async {
    final response = await http.get(Uri.parse(user.returnUrl(cityname)));
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

  changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.black, //Colors.yellow[200],
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
                      width: 300,
                      height: 400,
                      child: RiveAnimation.asset('assets/weather_app.riv')
/*                     TextField(
                      controller: _citynamecontroller,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (String cityname) async {
                        Weather currentweather = await fetchWeather(cityname);
                        print('current weather variable ?');
                        print('''Description:${currentweather.description}\n
                                 Temperature:${currentweather.temperature}\n
                                 wind speed:${currentweather.windspeed}\n
                                 feels like: ${currentweather.feelslike}
                        ''');
                      },
                    ), */

                      ),
                  Flexible(flex: 1, child: MyVerticalText('SUNNY')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
