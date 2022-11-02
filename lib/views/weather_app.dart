import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/model/weather_model.dart';
import 'package:flutter_application_2/service/weather_api_client.dart';
import 'package:flutter_application_2/views/additional_information.dart';
import 'package:flutter_application_2/views/current_weather.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

//  40.5283, 72.7985 = osh;
//  42.87, 74.59 = bishkek;
//  40.93, 73.0 = jalalAbad;
//  41.43, 75.99 = Naryn;
//  42.49, 78.39 = KaraKol;
//  40.0345, 70.4909 = Batken;
//  42.4911, 75.1656 = Chuy;
//  42.3121, 72.1433 = Talas;

  Future<void> getData() async {
    data = await client.getCurrentWeather(40.5283, 72.7985);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Weather App",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Image.asset(
                  "images/sunny.jpg",
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      currentWeather(Icons.wb_sunny_rounded, "${data!.temp}",
                          "${data!.cityName}"),
                      SizedBox(
                        height: 60.0,
                      ),
                      Text(
                        "Additional Information",
                        style: GoogleFonts.anton(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          fontSize: 30,
                        ),
                      ),
                      Divider(),
                      SizedBox(
                        height: 20.0,
                      ),
                      additionalInformation(
                          "${data!.wind}",
                          "${data!.humidity}",
                          "${data!.pressure}",
                          "${data!.feels_like}"),
                    ],
                  ),
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        },
      ),
    );
  }
}
