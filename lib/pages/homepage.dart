import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:rive/rive.dart';
import 'package:weather_app/widget/temperatureScale.dart';
import 'package:weather_app/widget/verticalText.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late RiveAnimationController _controller;

  void _togglePlay() =>
      setState(() => _controller.isActive = !_controller.isActive);
  bool get isPlaying => _controller.isActive;
  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('active');
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
                  /* Image.asset(
                    'assets/sunny.jpg',
                    width: 300,
                    height: 300,
                  ), */
                  Container(
                    width: 300,
                    height: 300,
                    child: RiveAnimation.asset(
                      'assets/sunny-loop.riv',
                      controllers: [_controller],
                      // onInit: (_) => setState(() {}),
                    ),
                  ),
                  Flexible(flex: 1, child: MyVerticalText('SUNNY')),
                ],
              ),
/*               Switch(
                value: _isPlaying,
                onChanged: (val) {
                  setState(() {
                    _isPlaying = val;
                  });
                  if (_isPlaying) {
                    _sunnyartboard.addController(SimpleAnimation('active'));
                  } else {
                    _sunnyartboard.addController(SimpleAnimation('idle'));
                  }
                },
              ), */
              /*  FloatingActionButton(
                onPressed: _togglePlay,
                tooltip: isPlaying ? 'Pause' : 'Play',
                child: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                ),
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