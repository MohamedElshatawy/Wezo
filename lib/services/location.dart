import 'package:geolocator/geolocator.dart';
class Location{
double lat,long;
Future<void> getCurrentLocation()async{
  try{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    long = position.longitude;
  }
  catch(e){
    print(e);
  }
}
}