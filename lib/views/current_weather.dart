import 'dart:js';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget currentWeather(
  IconData icon,
  String temp,
  String location,
) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.orange,
          size: 64.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "$temp",
          style:  GoogleFonts.kanit(
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "$location",
          style: GoogleFonts.lato(
            fontWeight: FontWeight.bold,
            fontSize: 40,
          ),
        ),
      ],
    ),
  );
}
