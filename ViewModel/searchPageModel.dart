import 'package:servicecom/ViewModel/baseModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SearchModel extends BaseModel{
  // a function to get data in a location
  var dataLat;
  var dataLong;
  getAddressData() async {
    await getLatitude();
    await getLongitude();
    //https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=parking&rankby=distance&key=$key
    var response =
    await http.get('https://cordeployapp.herokuapp.com'
        '/https://maps.googleapis.com/maps/api/geocode/json?'
        'location=$userLat,$userLong&type=$newController&rankby=distance'
        '&key=AIzaSyCMoNCotRB14c9nxYHloFXira3drIZpP00')
    ;
    var json = convert.jsonDecode(response.body);
    print(json['results'][0]['geometry']['bounds']['northeast']['lat']);
    print(json['results'][0]['geometry']['bounds']['northeast']['lng']);
    print(json['results'][0]['geometry']['bounds']['southwest']['lat']);
    print(json['results'][0]['geometry']['bounds']['southwest']['lng']);
    print(json['results'][0]['geometry']['location']['lat']);
    print(json['results'][0]['geometry']['location']['lng']);

      dataLat=json['results'][0]['geometry']['location']['lat'];
      notifyListeners();
      dataLong=json['results'][0]['geometry']['location']['lng'];
      notifyListeners();
  }


// a function to calculate distance

  // a function to map distance with location result

  // a function to open google map

  // a function to call phone number using url launcher


}