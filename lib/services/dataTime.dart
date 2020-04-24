import 'dart:convert';
import 'package:http/http.dart';
class Time{
  final String url;
  Time(this.url);

  Future<dynamic> getTime()async{
    Response response = await get(url);
    if(response.statusCode==200){
      return jsonDecode(response.body);
    }else{
      print(response.statusCode);
    }
  }

}