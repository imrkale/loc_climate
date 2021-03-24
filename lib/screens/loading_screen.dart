import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:loc_climate/services/location.dart';
import 'package:http/http.dart' as http;
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation()async
  {
      Location location=new Location();
      Position position=await location.getCurrentLocation();
      print(position.latitude);
      print(position.longitude);
  }

  void getData()async
  {
    http.Response response=await http.get("https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22");
    print(response.body);
  }


  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              onPressed: () {
                //Get the current location
                getData();
              },
              child: Text('Get Location'),
            ),
            RaisedButton(
              onPressed: () {
                //Get the current location
                getLocation();
              },
              child: Text('Get Location'),
            ),
          ],
        ),
      ),
    );
  }
}
