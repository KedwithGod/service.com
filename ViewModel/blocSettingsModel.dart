
import 'package:servicecom/Models/blocsetting.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class MainBloc extends BloCSetting {
List stateList=[];


  getStates(country,saveToken) async{
    var url='https://cordeployapp.herokuapp.com/https://www.universal-tutorial.com/api/states/$country';
    var req = await http.get(url, headers: {
      "Authorization": "Bearer ${saveToken['auth_token']}",
      "Accept": "application/json",

    });
    var results=convert.jsonDecode(req.body);
    for (var elements in results){
      stateList.add(elements['state_name']);
    }
    print(convert.jsonDecode(req.body));
    return convert.jsonDecode(req.body);
  }

  updateDropDown() async{

    await rebuildWidgets(ids: ['widget','function']);
  }

}
MainBloc mainBloc;