import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_time_app/pages/home.dart';
import 'package:weather_time_app/services/model.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<dynamic> updateUi()async{
    Model model = Model();
    var weatherData=await model.getWeather();
    var dateTime =await model.getTime();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home(weatherData,dateTime)));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
        ),
      ),
    );
  }
}
