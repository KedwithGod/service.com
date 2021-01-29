
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:servicecom/Models/firebaseAuth.dart';
import 'package:servicecom/Models/firebaseStorage.dart';
import 'package:servicecom/Models/firestore.dart';
import 'package:servicecom/Models/loading.dart';
import 'package:servicecom/Models/locator.dart';
import 'package:servicecom/Views/pageView/profilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'baseModel.dart';

class AddTradeModel extends BaseModel{
  // services from the locator
  FireStoreService _fireStore=locator<FireStoreService>();
  FirebaseService _firebaseAuth=locator<FirebaseService>();
  FirebaseStorageService _firebaseStorageService=locator<FirebaseStorageService>();

  // data variables
  var areYouInYourBusinessLocation;
  var businessAddress;
  var businessContact;
  var businessName;
  var businessType;
  var mobileNumber;
  var locationLng;
  var locationLat;
  var myCountry;
  List country;
  var state;
  var area;
  var businessCertificate;
  bool loadingIndicator;
  // file upload variables
  var file;
  var fileFolder;
  String fileName;
  bool loadingPath=false;
  var filePath;
  var fileSize;
  var fileByte;
  //focus node
  FocusNode focus;
  // get country data
  var saveToken;
  bool isList=false;
  List countryList=[];
  List countryFlag=[];
  List stateList=[];
  List cityList=[];
  String countrySelected;

  // pick image
  var uploadedImage;
  var optionText;

  // send pages back
  saveFinalPageState(value) async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setBool('areYouInYourBusinessLocation', value);
  notifyListeners();
}
  // return page
getFinalPageState() async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  areYouInYourBusinessLocation=_prefs.getBool('areYouInYourBusinessLocation');
  notifyListeners();
}
// save business contact data

  getBusinessAddress() async{
    SharedPreferences _businessAddress = await SharedPreferences.getInstance();
    businessAddress=_businessAddress .getString('_businessAddress');
    notifyListeners();
  }
  saveBusinessAddress(value) async{
    SharedPreferences _businessAddress = await SharedPreferences.getInstance();
    _businessAddress.setString('_businessAddress', value);
    notifyListeners();
  }
  saveBusinessType(value) async{
    SharedPreferences _businessDetails = await SharedPreferences.getInstance();
    _businessDetails.setString('businessType', value);
    notifyListeners();
  }

  getBusinessType() async{
    SharedPreferences _businessDetails = await SharedPreferences.getInstance();
    businessType=_businessDetails.getString('businessType');
    notifyListeners();
  }
  saveBusinessContact(value) async{
    SharedPreferences _businessDetails = await SharedPreferences.getInstance();
    _businessDetails.setString('businessContact', value);
    notifyListeners();
  }

  getBusinessContact() async{
    SharedPreferences _businessDetails = await SharedPreferences.getInstance();
    businessContact=_businessDetails.getString('businessContact');
    notifyListeners();
  }
  saveBusinessName(value) async{
    SharedPreferences _businessDetails = await SharedPreferences.getInstance();
    _businessDetails.setString('businessName', value);
    notifyListeners();
  }
  getBusinessName() async{
    SharedPreferences _businessDetails = await SharedPreferences.getInstance();
    businessName=_businessDetails.getString('businessName');
    notifyListeners();
  }
// save mobile number
  saveMobileNumber(value) async{
    SharedPreferences _mobileNumber = await SharedPreferences.getInstance();
    _mobileNumber.setString('mobileNumber', value);
    notifyListeners();
  }

  getMobileNumber() async{
    SharedPreferences _mobileNumber = await SharedPreferences.getInstance();
    mobileNumber=_mobileNumber.getString('mobileNumber');
    notifyListeners();
  }
// save country and state
  saveCountry(value) async{
    SharedPreferences _userAddress = await SharedPreferences.getInstance();
    _userAddress.setString('country', value);
    notifyListeners();
  }

  getCountry() async{
    SharedPreferences _userAddress= await SharedPreferences.getInstance();
   myCountry=_userAddress.getString('country');
    notifyListeners();
  }

  saveState(value) async{
    SharedPreferences _userAddress = await SharedPreferences.getInstance();
    _userAddress.setString('state', value);
    notifyListeners();
  }

  getState() async{
    SharedPreferences _userAddress= await SharedPreferences.getInstance();
    state=_userAddress.getString('state');
    notifyListeners();
  }
  saveArea(value) async{
    SharedPreferences _userAddress = await SharedPreferences.getInstance();
    _userAddress.setString('area', value);
    notifyListeners();
  }

  getArea() async{
    SharedPreferences _userAddress= await SharedPreferences.getInstance();
    area=_userAddress.getString('area');
    notifyListeners();
  }







  // start loading indicator
  startLoadingIndicator(){
    loadingIndicator=true;
    notifyListeners();
  }
  // stop loading indicator
  stopLoadingIndicator(){
    loadingIndicator=false;
    notifyListeners();
  }


  // open file explorer to select file
  openFileExplorer() async {
    try {
      FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.image,withData: true);

      if(result != null) {
        PlatformFile fileDetails = result.files.first;
        fileName=fileDetails.name;
        notifyListeners();
        print(fileName);
        file=result.files.single.path;
        notifyListeners();
        print(file);
        filePath=fileDetails.extension;
        notifyListeners();
        print(filePath);
        fileByte=fileDetails.hashCode;
        notifyListeners();
        print(fileByte);
        fileSize=fileDetails.size;
        notifyListeners();
        print(fileSize);
      } else {
        // User canceled the picker
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }

  }

//finally save business properties to data base

saveToDataBase(context,email,password,addedInfo) async {
    // display a loading indicator
  if(loadingIndicator==true) {
      Loading(Colors.yellow);
    }

    // get all saveSharedPreferences
  getBusinessAddress();
  getBusinessName();getBusinessType();
  getBusinessContact();
  getArea();
  getMobileNumber();
  if(myCountry==null) {
      getLongitude();
    }
    if(myCountry==null) {
      getLatitude();
    }
    else{
      getCountry();getState();
    }

    // firebaseAuth registering user
  await _firebaseAuth.signUpMethod(email, password, context);

  // saving all data to fireStore
 await _fireStore.saveData(businessName, businessType, businessContact,
     mobileNumber, file, email, password, addedInfo,businessAddress,context,
     locationLng:userLong,locationLat:userLat,country:myCountry,state:state);
 await _fireStore.noOfBusiness();

  // save document to firebase Storage
  _firebaseStorageService.uploadAnyFile(email, file, businessName, businessContact,filePath).then((value) =>
   Navigator.push(context, MaterialPageRoute(builder:(context)=>ProfilePage()))
  );


  // close loading indicator
  stopLoadingIndicator();

  // navigate to appropriate page

}

// focus node function
  onFocusChange(){
    if(focus.hasFocus){
     openFileExplorer();
      notifyListeners();
    }
    else{
      print('no value');
    }
  }
  // dispose focus node
  @override
  void dispose() {
    focus.dispose();
    super.dispose();}

    //get country, city and area data
  fetchData() async {
    var url = "https://cordeployapp.herokuapp.com/https://www.universal-tutorial.com/api/getaccesstoken";
    var req = await http.get(url, headers: {
      "Accept": "application/json",
      "api-token": "XKu_DZeS8iD8eoBfpWf0YaHqF_eJ9sLJjbvHrk_TJXDKihViYAqUsPKm_4Nq8R8GHLI",
      "user-email": "dareezekiel1994@yahoo.com"
    });
      saveToken=convert.jsonDecode(req.body);
      notifyListeners();
  }


  getStates(country) async{
    var url='https://cordeployapp.herokuapp.com/https://www.universal-tutorial.com/api/states/$country';
    var req = await http.get(url, headers: {
      "Authorization": "Bearer ${saveToken['auth_token']}",
      "Accept": "application/json",

    });
    stateList=[];
    notifyListeners();
    var results=convert.jsonDecode(req.body);
    print (results);
    if(results==null ){
      stateList=['No state found'];
      notifyListeners();
    }
   else{
      for (var elements in results){
        stateList.add(elements['state_name']);
        notifyListeners();
      }
    }


    print(convert.jsonDecode(req.body));
    return convert.jsonDecode(req.body);
  }

  getCities(String state)async{
    var url='https://cordeployapp.herokuapp.com/https://www.universal-tutorial.com/api/cities/$state';
    var req = await http.get(url, headers: {
      "Authorization": "Bearer ${saveToken['auth_token']}",
      "Accept": "application/json",

    });
    var results=convert.jsonDecode(req.body);
    for (var elements in results){
      cityList.add(elements['name']);
      notifyListeners();
    }
    print(convert.jsonDecode(req.body));
    return convert.jsonDecode(req.body);
  }


  getCountryList() async{
    var url = 'https://cordeployapp.herokuapp.com/https://restcountries.eu/rest/v2/all';
    Dio _dio = Dio();
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body) ;
      json!=null || json!=[] ? country=json:null;
      notifyListeners();
      json!=null || json!=[] ? isList=true:null;
      notifyListeners();
      // instead of using list view builder we are using
    // a for loop to take out the country name
    for (var elements in country){
      countryList.add(elements['name']);
      notifyListeners();
      countryFlag.add(elements['flag']);
      notifyListeners();
    }

  }


  futureCall(country)async {
    await fetchData();
    await getStates(country);
    return true;
  }
}