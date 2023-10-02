import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:weatherapp/widgets/specifications.dart';

class TodaysWeather extends StatelessWidget {
  TodaysWeather({
    super.key,
    required this.temp,
    required this.description,
    required this.clouds,
    required this.humidity,
    required this.pressure,
    required this.wSpeed,
    required this.sunrise,
    required this.sunset,
  });

  final String? temp;
  final String? description;
  final String? clouds;
  final String? humidity;
  final String? wSpeed;
  final String? pressure;
  final int? sunrise;
  final int? sunset;

  final String date = DateFormat("EEE dd"  ).format(DateTime.now());
  final String time = DateFormat("hh:mm aaa").format(DateTime.now());

  @override
  Widget build(BuildContext context) {

    String weatherIcon = description==null? 'clearsky' : description!.replaceAll(' ', '');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            //weather image
            Image.asset(
              'assets/$weatherIcon.png',
              height: 210,
              filterQuality: FilterQuality.high,
            ),

            //Temperature
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: temp,
                style: GoogleFonts.raleway(
                    fontSize: 80, fontWeight: FontWeight.w500),
              ),
              TextSpan(
                text: ' °C',
                style: GoogleFonts.raleway(
                  fontSize: 80,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ])),
            Text(
             description==null? 'error' : description!,
              style: GoogleFonts.raleway(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(124, 255, 255, 255)),
                ),
                Container(
                  alignment: Alignment.center,
                  child: const Text(
                    ' * ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(124, 255, 255, 255)),
                )
              ],
            ),

            //next days button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Next days',
                    style: GoogleFonts.raleway(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(143, 237, 216, 58)),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward,
                        )),
                  )
                ],
              ),
            ),

            // sunset and sunrise
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Specifications(
                  head: 'Sunrise',
                  text: sunrise.toString(),
                  image: 'assets/sun.png',
                ),
                Specifications(
                  head: 'Sunset',
                  text: sunset.toString(),
                  image: 'assets/moon.png',
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            const Divider(
              thickness: 0.4,
              color: Color.fromARGB(152, 0, 0, 0),
            ),
            const SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Specifications(
                  head: 'Clouds',
                  text: clouds == null ? 'error' : '$clouds %',
                ),
                Specifications(
                  head: 'Humidity',
                  text: humidity==null? 'error' :'$humidity %',
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            const Divider(
              thickness: 0.4,
              color: Color.fromARGB(152, 0, 0, 0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Specifications(
                  head:'Pressure',
                  text: pressure==null? 'error' : '$pressure hpa',
                ),
                Specifications(
                  head: 'Wind Speed',
                  text: wSpeed==null? 'error' :'$wSpeed m/sec',
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
