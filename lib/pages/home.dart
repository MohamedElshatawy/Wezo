import 'package:flutter/material.dart';
import 'package:weather_time_app/constants.dart';
import 'package:weather_time_app/services/model.dart';
import 'package:intl/intl.dart';
import 'package:weather_time_app/pages/loctionCity.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
class Home extends StatefulWidget {
  final  weatherData;
  final dateTime;
  Home(this.weatherData, this.dateTime);

  @override
  _HomeState createState() => _HomeState(weatherData,dateTime);
}

class _HomeState extends State<Home> {
  var weatherData;
  var dateTime;
  _HomeState(this.weatherData, this.dateTime);

  Model model =Model();
  int temperature;
  String weatherIcon,weatherMessage,time,city;
  void updateUi(){
    setState(() {
      if(weatherData==null && dateTime==null){
        temperature=0;
        weatherIcon='error';
        weatherMessage = 'Unable to get weather data';
        time='00';
        return;
      }
      double temp =weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = model.getWeatherIcon(condition);
      weatherMessage= model.getMessage(temperature);
      city =weatherData['name'];
      var data=dateTime['datetime'];
      var offset = dateTime['utc_offset'].substring(1,3);
      DateTime now = DateTime.parse(data);
      now = now.add(Duration(hours: int.parse(offset)));
      time =DateFormat.jm().format(now);
    });
  }
  @override
  void initState() {
    super.initState();
    updateUi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ClipPath(
                    child: Container(
                      height: 95.0,
                      color:kColorClipPath,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              onPressed: () async{
                                var location =await Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationCity()));
                                if(location!=null){
                                  weatherData = await model.getCityWeather(location['city']);
                                  dateTime=await model.getCityTime(location['continent']);
                                  updateUi();
                                }
                              },
                              icon: Icon(
                                Icons.near_me,
                                size: 40.0,
                                color: kColor1,
                              ),
                            ),
                          ),

                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: ()async {
                                weatherData=await model.getWeather();
                                dateTime=await model.getTime();
                                updateUi();
                              },
                              icon: Icon(
                                Icons.location_city,
                                size: 40.0,
                                color: kColor1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    clipper: WaveClipperTwo(),
                  ),
                  SizedBox(height: kSizedBox,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.timer,
                      ),
                      SizedBox(width: 20.0,),
                      Text(
                        '$time',
                        style: kTextTimeStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kSizedBox,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          '$city',
                          style: kTextStyle,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        '$temperature °C',
                        style: kDegreeStyle,
                      ),
                      SizedBox(width: kSizedBox,),
                      Text(
                        '$weatherIcon',
                        style: kDegreeStyle,
                      ),
                    ],
                  ),

                  SizedBox(height: 100.0,),
                  Container(
                    color: kColorClipPath,
                    alignment: Alignment.center,
                    padding:const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "$weatherMessage in $city!",
                      style: kTextBottomStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
