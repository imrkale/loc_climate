import 'package:geolocator/geolocator.dart';

class Location
{
  Position position;
  Future<Position> getCurrentLocation()async
  {
    try{
      position =await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    }catch(e)
    {
      print(e);
    }
    return position;
  }

}
