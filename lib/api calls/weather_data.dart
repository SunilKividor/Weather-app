import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather.dart';

class WeatherData {
  Future<Weather>? getData(double latitude,double longitude) async {
    var apiCall = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=a26c4d9b0faa63aa2a23aac1d9bfb70b&units=metric');
    var response = await http.get(apiCall);
    var data = jsonDecode(response.body);
    return Weather.convertJsonData(data);
  }
}