// ignore_for_file: prefer_typing_uninitialized_variables

class Weather {

  var city;
  var temp;
  var description;
  var lastUpdate;
  var sunrise;
  var sunset;
  var clouds;
  var humidity;
  var pressure;
  var windSpeed;
  var icon;

  Weather({
    required this.city,
    required this.temp,
    required this.description,
    required this.lastUpdate,
    required this.sunrise,
    required this.sunset,
    required this.clouds,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
  });

  Weather.convertJsonData(Map<String,dynamic> data){
    city = data['name'];
    temp = data['main']['temp'];
    description = data['weather'][0]['description'];
    lastUpdate = data['dt'];
    sunrise = data['sys']['sunrise'];
    sunset = data['sys']['sunset'];
    clouds = data['clouds']['all'];
    humidity = data['main']['humidity'];
    pressure = data['main']['pressure'];
    windSpeed = data['wind']['speed'];
  }
  
}