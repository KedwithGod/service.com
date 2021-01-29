import 'package:flutter/services.dart';
import 'package:location/location.dart';

class GetLocation {

  final Location location = Location();

  LocationData _location;
  String _errorOnce;
   getLocation() async {
    try {
      final LocationData _locationResult = await location.getLocation();
      return  _locationResult;
    } on PlatformException catch (err) {
        _errorOnce = err.code;
    }
  }
}

