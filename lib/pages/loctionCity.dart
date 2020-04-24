import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:weather_time_app/constants.dart';

class LocationCity extends StatefulWidget {
  @override
  _LocationCityState createState() => _LocationCityState();
}

class _LocationCityState extends State<LocationCity> {
  String city;
  String continent;
  List<String> list = [
    "Africa/Cairo",
    "Africa/Tunis",
    "Africa/Casablanca",
    "America/Araguaina",
    "America/New_York",
    "America/Los_Angeles",
    "Asia/Amman",
    "Asia/Dubai",
    "Asia/Gaza",
    "Asia/Hong_Kong",
    "Asia/Qatar",
    "Asia/Riyadh",
    "Asia/Seoul",
    "Asia/Tokyo",
    "Australia/Sydney",
    "Europe/Amsterdam",
    "Europe/London",
    "Europe/Madrid",
    "Europe/Moscow",
    "Europe/Paris",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[

                ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    height: 100.0,
                    color: kColorClipPath,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 40.0,
                          color: kColor1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: kSizedBox,
                ),
                Container(
                  margin: EdgeInsets.all(50.0),
                  child: Center(
                    child: TextField(
                      onChanged: (value) {
                        city = value;
                      },
                      style: kInputTextStyle,
                      decoration: kInputDecorationStyle,
                    ),
                  ),
                ),
                DropdownButton<String>(
                  value: continent,
                  hint: Text(
                    'Select the Contienent to Know Time',
                    style: kHintTextDropDownStyle,
                  ),
                  icon: Icon(
                    Icons.home,
                    color: kColor,
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style: kDropButtonStyle,
                  underline: Container(
                    height: 2,
                    color: kColor,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      continent = newValue;
                    });
                  },
                  items: list.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 30.0,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context, {
                      'city': city,
                      'continent': continent,
                    });
                  },
                  color: kColor,
                  child: Text(
                    'Change',
                    style: kFlatButtonStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
