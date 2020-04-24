import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kTextStyle = TextStyle(
  fontFamily: 'Bahianita',
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
);
const kTextBottomStyle = TextStyle(
  fontFamily: 'Spartan',
  fontSize: 15.0,
);
const kDegreeStyle = TextStyle(
  fontFamily: 'Spartan',
  fontSize: 40.0,
);
const kColor = Color(0x8F00FF00);
const kColor1 = Colors.white;

const kSizedBox = 55.0;
const kTextTimeStyle = TextStyle(
  fontFamily: 'Spartan',
  fontSize: 30.0,
);
const kApiKey = 'fa477f7feb41b8599034c21f6f4d04a2';
const kOpenWeather = 'https://api.openweathermap.org/data/2.5/weather';
const kHintTextStyle = TextStyle(color: Color(0xFf000000));
const kInputTextStyle = TextStyle(
  color: Color(0xFF000000),
);
const kInputDecorationStyle = InputDecoration(
  hintText: ' City to Know Weather',
  hintStyle: kHintTextStyle,
  suffixIcon: Icon(Icons.location_on,color: kColor,),
  filled: true,
  fillColor: Colors.white,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),

);
const kFlatButtonStyle=TextStyle(
  fontSize: 20.0,
  color: Color(0xFFFFFFFF),
);
const kDropButtonStyle=TextStyle(
  color: Color(0xFFFFFFFF),
);
const kHintTextDropDownStyle=TextStyle(
  color: Color(0xFFFFFFFF),
);
const kColorClipPath=Colors.red;