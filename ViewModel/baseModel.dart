import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BaseModel extends ChangeNotifier {
  final Location location = Location();
  // homepage Controller
  TextEditingController newController = TextEditingController();
  var searchValue;
  var userLat;
  var userLong;
  LocationData locationValue;
  String _errorOnce;

  // get location
  getLocation() async {
    try {
      final LocationData locationValue = await location.getLocation();
      notifyListeners();
      storeBearing('userLat',locationValue.latitude);
      notifyListeners();
      storeBearing('userLong',locationValue.longitude);
      notifyListeners();
      return locationValue;
    } on PlatformException catch (err) {
      _errorOnce = err.code;
      print(err.code);
      notifyListeners();
      return _errorOnce;
    }
  }

  // save search value temporarily
  storeSearchValue() async {
    SharedPreferences preference= await SharedPreferences.getInstance();
    preference.setString('searchValue',newController.text);
  }
// get user search value
  getSearchValue() async{
    SharedPreferences preference= await SharedPreferences.getInstance();
    searchValue=preference.getString('searchValue');
    notifyListeners();
  }
  // save user location temporarily
  storeBearing(name, value) async {
    SharedPreferences preference= await SharedPreferences.getInstance();
    preference.setDouble(name,value);
  }
// get user latitude
  getLatitude() async{
    SharedPreferences preference= await SharedPreferences.getInstance();
    userLat=preference.getDouble('userLat');
    notifyListeners();
    print(userLat);
  }
// get user longitude
  getLongitude() async{
    SharedPreferences preference= await SharedPreferences.getInstance();
    userLong=preference.getDouble('userLong');
    notifyListeners();
    print(userLong);
  }

  forwardGeoCoding(country,state) async {
    var url='https://cordeployapp.herokuapp.com/http://api.positionstack.com/v1/forward ? '
        'access_key = b7d76f91a87ceaa4b517555de7389624 & query = $state, $country';
    var req= await http.get(url);
    var results=convert.jsonDecode(req.body);
    var lat;
    var long;
    if(results!=null ){
      lat=results['data']['results'][0]['latitude'];
      long=results['data']['results'][0]['longitude'];
      notifyListeners();
    }
  }
  reverseGeoCoding(lat,long){
  /*  http://api.positionstack.com/v1/reverse
    ? access_key = b7d76f91a87ceaa4b517555de7389624
    & query = 40.7638435,-73.9729691*/
  }
}
