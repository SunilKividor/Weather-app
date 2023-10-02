import 'package:flutter/material.dart';
import 'package:weatherapp/homepage.dart';
import 'package:weatherapp/pallet/colors.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: kScaffoldColor,
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}