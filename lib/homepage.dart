import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/api%20calls/weather_data.dart';
import 'package:weatherapp/get_location.dart';
import 'package:weatherapp/models/weather.dart';
import 'package:weatherapp/pallet/colors.dart';
import 'package:weatherapp/widgets/todays_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather? data;

  Future<void> info() async {
    var location = await determinePosition();
    data = await WeatherData().getData(location.latitude, location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    final String time = DateFormat("aaa").format(DateTime.now());
    return Scaffold(
      body: FutureBuilder(
        future: info(),
        builder: (ctx, snapshot) {
          
          return Container(
            padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
            width: double.infinity,
            decoration: const BoxDecoration(gradient: kScaffoldColorHome),
            child: snapshot.connectionState == ConnectionState.waiting ? const Center(child: CircularProgressIndicator()) :
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //app bar
                Row(
                  children: [
                    Text(
                      '${data?.city}',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 20,
                          color: const Color.fromARGB(205, 255, 255, 255)),
                    ),
                    Transform.rotate(
                      angle: -45 * 3.141592653589793 / 180,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 30,
                          color: Color.fromARGB(205, 255, 255, 255),
                        ),
                      ),
                    ),
                  ],
                ),
                //Greetings
                Text(
                  time == 'AM' ? 'GOOD MORNING' : 'GOOD EVENING',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),

                //Main Today's Weather
                TodaysWeather(
                  temp: data?.temp.toString(),
                  description: data?.description,
                  clouds: data?.clouds.toString(),
                  humidity: data?.humidity.toString(),
                  pressure: data?.pressure.toString(),
                  wSpeed: data?.windSpeed.toString(),
                  sunrise: data?.sunrise,
                  sunset: data?.sunset,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
