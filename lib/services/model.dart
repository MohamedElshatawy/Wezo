import 'package:weather_time_app/services/location.dart';
import 'package:weather_time_app/services/weather.dart';
import 'package:weather_time_app/services/dataTime.dart';
import 'package:weather_time_app/constants.dart';


class Model{
Future<dynamic> getWeather()async{
  Location location = Location();
  await location.getCurrentLocation();
  Weather weather = Weather('$kOpenWeather?lat=${location.lat}&lon=${location.long}&appid=$kApiKey&units=metric');
  var weatherData = await weather.getData();
  return weatherData;
}
Future<dynamic> getCityWeather(String city)async{
  Weather weather = Weather('$kOpenWeather?q=$city&appid=$kApiKey&units=metric');
  var weatherData = await weather.getData();
  return weatherData;
}

Future<dynamic> getTime()async{
  Time data = Time('http://worldtimeapi.org/api/timezone/Africa/Cairo');
  var dateTime =await data.getTime();
  return dateTime;
}
Future<dynamic> getCityTime(String country)async{
  Time data = Time('http://worldtimeapi.org/api/timezone/$country');
  var dateTime =await data.getTime();
  return dateTime;
}
String getWeatherIcon(int condition) {
  if (condition < 300) {
    return '☁';
  } else if (condition < 400) {
    return '☂️';
  } else if (condition < 600) {
    return '☔️';
  } else if (condition < 700) {
    return '☃️';
  } else if (condition < 800) {
    return '❄';
  } else if (condition == 800) {
    return '☀';
  } else if (condition <= 804) {
    return '⛅';
  } else {
    return '🤷‍';
  }
}

String getMessage(int temp) {
  if (temp > 25) {
    return 'It\'s 🍦 time';
  } else if (temp > 20) {
    return 'Time for shorts and 👕';
  } else if (temp < 10) {
    return 'You\'ll need gloves and socks';
  } else {
    return 'Bring a Jacket just in case';
  }
}
}
