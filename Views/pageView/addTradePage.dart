import 'dart:async';
import 'package:flutter/material.dart';
import 'package:servicecom/Models/blocsetting.dart';
import 'package:servicecom/ViewModel/addTradeModel.dart';
import 'package:servicecom/ViewModel/blocSettingsModel.dart';
import 'package:servicecom/Views/Uielements/Generalbuttondisplay.dart';
import 'package:servicecom/Views/Uielements/Generaltextdisplay.dart';
import 'package:servicecom/Views/Uielements/Generaltextfielddisplay.dart';
import 'package:stacked/stacked.dart';
import 'homePage.dart';
import 'loginPage.dart';
import 'package:flutter/foundation.dart';

class AddTrade extends StatefulWidget {
  @override
  _AddTradeState createState() => _AddTradeState();
}

class _AddTradeState extends State<AddTrade> with TickerProviderStateMixin {
  // to detect when text field is clicked

  // function to execute when the textField is edited

  var _countrySelected;
  var _stateSelected;
  int _addDetail=0;
  TextEditingController _businessName=TextEditingController();
  TextEditingController _businessType=TextEditingController();
  TextEditingController _businessContact=TextEditingController();
  TextEditingController _mobileNumber=TextEditingController();
  TextEditingController _fullAddress=TextEditingController();
  TextEditingController _uploadBusiness=TextEditingController();
  TextEditingController _emailAddress=TextEditingController();
  TextEditingController _password=TextEditingController();
  TextEditingController _anyOther=TextEditingController();
  List<double> stackPosition=[700.0,275.0];

  int stackAnimationIndex=0;

  //form key to validate the text field
  GlobalKey<FormState> addTradeKey =GlobalKey<FormState>();
  GlobalKey<FormState> businessDetailKey =GlobalKey<FormState>();
  GlobalKey<FormState> mobileDetail =GlobalKey<FormState>();
  GlobalKey<FormState> locationDetail =GlobalKey<FormState>();
  GlobalKey<FormState> finalDetail =GlobalKey<FormState>();


  // first value list variable
  List<ListItem> _dropdownItems = [
    ListItem(1, "Country"),
    ListItem(2, "State"),
    ListItem(3, "City"),
    ListItem(4, "Fourth Item")
  ];



  // converting list to dropdown menu items
  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems( listItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: GeneralTextDisplay(listItem.name, Colors.white, 1,
              15, FontWeight.w400, listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }
  void initState() {
    super.initState();
  /*  _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;*/
    _customAnimation();
    _initTimer();
  }

  // animation variables
  AnimationController _controller;
  Animation _animation;
  // animation functions
  _customAnimation(){
    _controller= AnimationController(duration:Duration(milliseconds:3000),vsync: this,);
    _animation=Tween(begin:0.0,end: 1.0).animate(CurvedAnimation(
      curve: Curves.decelerate,parent: _controller,));
    _controller.forward();
  }

  // timer function
 Timer timer;
  // timer fuction
  _initTimer(){
    timer=Timer.periodic(Duration(milliseconds:100), (timer) {
      if(stackAnimationIndex<stackPosition.length-1){
        setState(() {
          stackAnimationIndex++;
        });
      }
      else if (stackAnimationIndex==stackPosition.length-1){
        timer.cancel();
      }
    });
  }
  _reverseTimer(){
    timer=Timer.periodic(Duration(milliseconds:100), (timer) {
      if(stackAnimationIndex==stackPosition.length-1){
        setState(() {
          stackAnimationIndex=0;
        });

      }

      if (stackAnimationIndex<stackPosition.length-1){
        timer.cancel();
      }
    });
  }
/*
  // updating old widget
  @override
  void didUpdateWidget(AddTrade oldWidget) {
    _controller.reset();
   _controller.forward();
    super.didUpdateWidget(oldWidget);
  }

  */// dispose animation controller

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();}
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTradeModel>.reactive(
    onModelReady: (model) {
    model.getLocation();

      model.getCountryList();
 /*   model.countryList=!null?_countryMenuItems = buildDropDownMenuItems(model.countryList):
    _countryMenuItems = buildDropDownMenuItems(_dropdownItems);*/
    },
        disposeViewModel: false,
    viewModelBuilder: () => AddTradeModel(),
    builder: (context, model, child) =>Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        width: 375,
        height:667,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/addpage.jpg'),
                fit: BoxFit.cover,alignment: Alignment.center)
        ),
        child: Container(
          width: 375,
          height:667,
          color: Color.fromRGBO(0, 0, 0, 0.47),
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 20,
                child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                    },
                    child: Icon(Icons.home,color: Colors.white, size: 24, )),
              ),
              Positioned(
                left:330,
                top: 20,
                child:  GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()))
                    ;                              },
                  child: Icon(Icons.edit, size: 20,color:
                  Colors.white)),)
            ,Positioned(
                left: 17,
                top: 97,
                child: SizeTransition(
                  sizeFactor: _controller,
                  child: GeneralTextDisplay('Let the world Know about Your business',
                      Colors.white, 1, 17, FontWeight.bold, 'addtradeTitle'),
                ),
              ),
              Positioned(
                left: 19,
                top: 146,
                child: SlideTransition(
                  position: Tween(
                      begin: Offset(1, 0),
                      end:Offset(0,0)
                  ).animate(_controller),
                  child: Container(
                    width: 334,
                    height: 68,

                    child: GeneralTextDisplay(
                        'Register your business for free and get enough daily customer calling and rushing to your door.\nAt service.com our work is to let everyone around you know about you then your service.',
                        Color.fromRGBO(200, 200, 200,1.0), 6, 14, FontWeight.w400, 'addTradeSubTitle'),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInSine,
                left: 19,
                top: stackPosition[stackAnimationIndex],
                child: RotationTransition(
                  turns:_animation,
                  child: Container(
                    width: 338,
                    height: 372,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.28),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child:AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child: IndexedStack(
                        index: _addDetail,
                          key: ValueKey(_addDetail),
                        children: [
                          Form(
                            key: businessDetailKey,
                            child: Stack(
                              key: UniqueKey(),
                              children: [
                                Positioned(
                                    left:22 ,
                                    top: 25,
                                    child: GeneralTextDisplay(
                                        'To start, Input the following details',
                                        Color.fromRGBO(255, 255, 0, 1.0),
                                        1,
                                        17,
                                       FontWeight.w600,
                                        'start input')),
                                Positioned(
                                  left:16 ,
                                  top: 79,
                                  child: GeneralTextField(
                                      TextInputType.text,
                                      _businessName,
                                      'Business Name',
                                      'What is your business Name ',
                                      'name',
                                      1,
                                      46,306),
                                ),
                                Positioned(
                                  left:16 ,
                                  top: 145,
                                  child: GeneralTextField(
                                      TextInputType.text,
                                      _businessType,
                                      'Business Type',
                                      'What type of business do you do e.g tailor ',
                                      'name',
                                      1,
                                      46,306),
                                ),
                                Positioned(
                                  left:16 ,
                                  top: 211,
                                  child: GeneralTextField(
                                      TextInputType.number,
                                      _businessContact,
                                      'Business Contact',
                                      'What is your business Contact e.g 081234585',
                                      'workPhone',
                                      1,
                                      46,306),
                                ),

                                Positioned(
                                  left:16,
                                  top:281,
                                  child: GeneralButton(
                                      1,
                                      'Next',
                                      'Next',
                                      Color.fromRGBO(191, 191,0, 1.0),
                                      17,
                                      FontWeight.bold,
                                      40,
                                      306,
                                          (){if(businessDetailKey.currentState.validate()){
                                            model.saveBusinessName(_businessName.text);
                                            model.saveBusinessContact(_businessContact.text);
                                            model.saveBusinessType(_businessType.text);
                                            setState(() {

                                              stackAnimationIndex=1;
                                              _reverseTimer();
                                              //give timer for the login to reverse animation
                                              Future.delayed(Duration(milliseconds: 630),(){
                                                setState(() {
                                                  _addDetail=1;
                                                  stackAnimationIndex=0;
                                                  _initTimer();
                                                });
                                              });
                                            });
                                          }

                                          },
                                      Color.fromRGBO(0, 0, 0, 0.51),
                                      Colors.black,
                                      5.0),
                                )
                              ],
                            ),
                          ),
                          Form(
                            key:mobileDetail,
                            child: Stack(
                              key: UniqueKey(),
                             children: [
                               Positioned(
                                 left:10,
                                 top: 21,
                                 child:  GestureDetector(
                                     onTap: (){
                                       setState(() {
                                         stackAnimationIndex=1;
                                         _reverseTimer();
                                         //give timer for the login to reverse animation
                                         Future.delayed(Duration(milliseconds: 630),(){
                                           setState(() {
                                             _addDetail=0;
                                             stackAnimationIndex=0;
                                             _initTimer();
                                           });
                                         });
                                       });
                                                                     },
                                     child: Icon(Icons.arrow_back, size: 15,color:
                                     Colors.yellow)),),
                               Positioned(
                                   left:63 ,
                                   top: 18,
                                   child: GeneralTextDisplay(
                                       'Almost Done...',
                                       Color.fromRGBO(255, 255, 0, 1.0),
                                       1,
                                       17,
                                       FontWeight.w600,
                                       'Almost Done...')),
                               Positioned(
                                 left:16 ,
                                 top: 79,
                                 child: GeneralTextField(
                                     TextInputType.text,
                                     _mobileNumber,
                                     'Mobile Number',
                                     'What is your Mobile number ',
                                     'workPhone',
                                     1,
                                     46,306),
                               ),
                               Positioned(
                                   left:13 ,
                                   top: 151,
                                   child: GeneralTextDisplay(
                                       'Are you currently in your work place or shop or \nbusiness location?',
                                       Color.fromRGBO(255, 255, 128, 1.0),
                                       2,
                                       15,
                                       FontWeight.w400,
                                       'ibeere')),
                               Positioned(
                                 left:16,
                                 top:207,
                                 child: GeneralButton(
                                     1,
                                     'Yes',
                                     'Yes',
                                     Color.fromRGBO(149, 242,4, 1.0),
                                     14,
                                     FontWeight.bold,
                                     40,
                                     306,
                                         (){if(mobileDetail.currentState.validate()){
                                           // save mobile number
                                           model.saveMobileNumber(_mobileNumber.text);
                                           model.focus= FocusNode();
                                           model.focus.addListener(model.onFocusChange);
                                           // save location
                                           model.getLocation();
                                           setState(() {
                                             // ensuring back button return to
                                             // location page
                                             model.saveFinalPageState(true);
                                             model.getFinalPageState();
                                             // amimating the stack
                                             stackAnimationIndex=1;
                                             _reverseTimer();
                                             //give timer for the login to reverse animation
                                             Future.delayed(Duration(milliseconds: 630),(){
                                               setState(() {
                                                 _addDetail=3;
                                                 stackAnimationIndex=0;
                                                 _initTimer();
                                               });
                                             });
                                           });}
                                     },
                                     Color.fromRGBO(0, 0, 0, 0.51),
                                     Colors.black,
                                     5.0),
                               ),
                               Positioned(
                                 left:16,
                                 top:262,
                                 child: GeneralButton(
                                     1,
                                     'No',
                                     'No',
                                     Color.fromRGBO(255, 0,27, 1.0),
                                     14,
                                     FontWeight.bold,
                                     40,
                                     306,
                                         (){if(mobileDetail.currentState.validate()){
                                           // save mobile number
                                           model.saveMobileNumber(_mobileNumber.text);
                                           setState(() {
                                             // ensuring back button return to
                                             // location page
                                             model.saveFinalPageState(false);
                                             model.getFinalPageState();
                                             // animation update
                                             stackAnimationIndex=1;
                                             _reverseTimer();
                                             //give timer for the login to reverse animation
                                             Future.delayed(Duration(milliseconds: 630),(){
                                               setState(() {
                                                 // page update
                                                 _addDetail=2;
                                                 stackAnimationIndex=0;
                                                 _initTimer();
                                               });
                                             });
                                           });
                                     }},
                                     Color.fromRGBO(0, 0, 0, 0.51),
                                     Colors.black,
                                     5.0),
                               )
                             ],
                            ),
                          ),
                          Form(
                            key: locationDetail,
                            child: Stack(
                              key: UniqueKey(),
                              children: [
                                Positioned(
                                  left:10,
                                  top: 21,
                                  child:  GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          stackAnimationIndex=1;
                                          _reverseTimer();
                                          //give timer for the login to reverse animation
                                          Future.delayed(Duration(milliseconds: 630),(){
                                            setState(() {
                                              _addDetail=1;
                                              stackAnimationIndex=0;
                                              _initTimer();
                                            });
                                          });
                                        });
                                      },
                                      child: Icon(Icons.arrow_back, size: 15,color:
                                      Colors.yellow)),),
                                Positioned(
                                    left:63 ,
                                    top: 18,
                                    child: GeneralTextDisplay(
                                        'Location Update',
                                        Color.fromRGBO(255, 255, 0, 1.0),
                                        1,
                                        17,
                                        FontWeight.w600,
                                        'Location Update')),
                                Positioned(
                                    left:15,
                                    top: 56,
                                    child: GeneralTextDisplay(
                                        'Enter the following so that people can easily \nlocate your business',
                                        Color.fromRGBO(255, 255, 128, 1.0),
                                        2,
                                        15,
                                        FontWeight.w500,
                                        'Location Update subtitle')),
                                Positioned(
                                  left:15 ,
                                  top: 111,
                                  child: Container(
                                    width: 306,
                                    height: 46,
                                    padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),

                                        border: Border.all(
                                            color: Colors.white
                                        )),
                                    child: DropdownButtonHideUnderline(
                                      child:StatesBuilder(
                                        stateID: 'widget',
                                        blocs: [mainBloc],
                                        builder: (_)=> DropdownButton(
                                              dropdownColor: Colors.black,
                                              iconEnabledColor:Colors.yellow[700],
                                              hint: Text('Choose country',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.yellow,
                                                      fontSize: 12)),
                                              value: _countrySelected,
                                              items:model.countryList
                                                  .map<DropdownMenuItem>(( value) {
                                                return DropdownMenuItem(
                                                    value: value,
                                                    child: GeneralTextDisplay(value, Colors.white, 1,
                                                        15, FontWeight.w400, value));
                                              }).toList(),

                                              onChanged: (val) {
                                                setState(() {
                                                  _countrySelected=val;
                                                });
                                                // fetxh states of selected country
                                                model.futureCall(val);
                                                // reload state of the selected country
                                                mainBloc.updateDropDown();
                                                // save country to shared preference
                                                model.saveCountry(val);
                                                print(val);

                                              }),
                                    ),
                                    ),
                                  )),
                                Positioned(
                                  left:15 ,
                                  top: 174,
                                  child: Container(
                                    width: 306,
                                    height: 46,
                                    padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),

                                        border: Border.all(
                                            color: Colors.white
                                        )),
                                    child:
                                    DropdownButtonHideUnderline(
                                      child: StatesBuilder(
                                          stateID: 'function',
                                          blocs: [mainBloc],
                                          builder: (_)=>DropdownButton(
                                                  dropdownColor: Colors.black,
                                                  iconEnabledColor: Colors.yellow[700],
                                                  hint: Text( _countrySelected==null? 'Loading state..' :'Choose a state',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w400,
                                                          color: Colors.yellow,
                                                          fontSize: 12)),
                                                  value: _stateSelected,
                                                  items:model.stateList==null ||model.stateList==[]?<String>['No State found']: model.stateList
                                                      .map<DropdownMenuItem>(( value) {
                                                    return DropdownMenuItem(
                                                        value: value,
                                                        child: GeneralTextDisplay(value, Colors.white, 1,
                                                            15, FontWeight.w400, value));
                                                  }).toList(),
                                                  onChanged: (val) {
                                                    setState(() {
                                                      _stateSelected=val;
                                                    });
                                                    // save state selected to shared preferemce
                                                    model.saveState(val);

                                                  })



                                    )),


                                 /*
                                  DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          dropdownColor: Color.fromRGBO(255, 255, 0, 0.47),
                                          iconEnabledColor: _stateSelectedItem==null?Colors.white: Colors.yellow[700],
                                          value: _stateSelectedItem??'State',
                                          items: _stateMenuItems,
                                          onChanged: (value) {
                                            setState(() {
                                              _stateSelectedItem = value;
                                            });
                                            model.getCities(value);
                                            model.cityList!=[]?_cityMenuItems= buildDropDownMenuItems(model.cityList):null;
                                          }),
                                    ),
                                  )


                                  GeneralTextField(
                                    // TO DO: add a search box suggestion to this using flutter search delegate
                                      TextInputType.text,
                                      _state,
                                      'State',
                                      'Select State',
                                      'name',
                                      1,
                                      46,306),*//*
                                )*/)),
                                Positioned(
                                  left:15 ,
                                  top: 236,
                                  child: GeneralTextField(
                                    // TO DO: add a search box suggestion to this using flutter search delegate
                                      TextInputType.text,
                                      _fullAddress,
                                      'Business Address',
                                      'Enter full business address',
                                      'name',
                                      1,
                                      46,306),
                                ),
                                Positioned(
                                  left:16,
                                  top:304,
                                  child: GeneralButton(
                                      1,
                                      'Next',
                                      'Next',
                                      Color.fromRGBO(255, 255, 128, 1.0),
                                      17,
                                      FontWeight.bold,
                                      40,
                                      306,
                                          (){
                                        if(locationDetail.currentState.validate()){
                                          // save business address
                                          model.saveBusinessAddress(_fullAddress.text);
                                          model.focus= FocusNode();
                                          model.focus.addListener(model.onFocusChange);
                                          setState(() {
                                            stackAnimationIndex=1;
                                            _reverseTimer();
                                            //give timer for the login to reverse animation
                                            Future.delayed(Duration(milliseconds: 630),(){
                                              setState(() {
                                                _addDetail=3;
                                                stackAnimationIndex=0;
                                                _initTimer();
                                              });
                                            });
                                          });
                                        }

                                      },
                                      Color.fromRGBO(0, 0, 0, 0.51),
                                      Colors.black,
                                      5.0),
                                )

                              ],
                            ),
                          ),
                          Form(
                            key:finalDetail,
                            child: Stack(
                              key: UniqueKey(),
                              children: [
                                Positioned(
                                  left:10,
                                  top: 21,
                                  child:  GestureDetector(
                                      onTap: (){
                                        setState(() {
                                          stackAnimationIndex=1;
                                          _reverseTimer();
                                          //give timer for the login to reverse animation
                                          Future.delayed(Duration(milliseconds: 630),(){
                                            setState(() {
                                              model.areYouInYourBusinessLocation==true?_addDetail=1:_addDetail=2;
                                              stackAnimationIndex=0;
                                              _initTimer();
                                            });
                                          });
                                        });
                                      },
                                      child: Icon(Icons.arrow_back, size: 15,color:
                                      Colors.yellow)),),
                                Positioned(
                                    left:63 ,
                                    top: 18,
                                    child: GeneralTextDisplay(
                                        'Finally',
                                        Color.fromRGBO(255, 255, 0, 1.0),
                                        1,
                                        17,
                                        FontWeight.w600,
                                        'final page')),
                                Positioned(
                                  left:19 ,
                                  top: 65,
                                  child: GeneralTextField(
                                    // TO DO: add a search box suggestion to this using flutter search delegate
                                      TextInputType.text,
                                      _uploadBusiness,
                                     model.file==null?'Upload Business':model.fileName.toString(),
                                      model.file==null?'Upload Business Certificate':model.fileSize+model.fileByte,
                                      '',
                                      1,
                                      46,306,focusNode: model.focus,),
                                ),
                                Positioned(
                                  left:19,
                                  top: 130,
                                  child: GeneralTextField(
                                    // TO DO: add a search box suggestion to this using flutter search delegate
                                      TextInputType.text,
                                      _emailAddress,
                                      'Email Address',
                                      'Email Address ( use this to login)',
                                      'email',
                                      1,
                                      46,306),
                                ),
                                Positioned(
                                  left:19 ,
                                  top: 193,
                                  child: GeneralTextField(
                                    // TO DO: add a search box suggestion to this using flutter search delegate
                                      TextInputType.text,
                                      _password,
                                      'Password',
                                      'Password (use this to login)',
                                      'name',
                                      1,
                                      46,306),
                                ),
                                Positioned(
                                  left:19 ,
                                  top: 256,
                                  child: GeneralTextField(
                                    // TO DO: add a search box suggestion to this using flutter search delegate
                                      TextInputType.text,
                                      _anyOther,
                                      'Other Information',
                                      'Any other neccessary information',
                                      '',
                                      1,
                                      46,306),
                                ),
                                Positioned(
                                  left:16,
                                  top:313,
                                  child: GeneralButton(
                                      1,
                                      'Done',
                                      'Done',
                                      Color.fromRGBO(255, 255, 128, 1.0),
                                      17,
                                      FontWeight.bold,
                                      40,
                                      306,
                                       (){
                                      if(finalDetail.currentState.validate()){
                                        model.startLoadingIndicator();
                                        model.saveToDataBase(context,_emailAddress.text, _password.text,_anyOther.text);
                                      }
                                       },
                                      Color.fromRGBO(0, 0, 0, 0.51),
                                      Colors.black,
                                      5.0),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )),

          ],
          ),
        ),
      )
    ));
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
// ToDo: check how the country data is displayed and  format it into a list
// ToDo: use the list to populate country data and also state and cities
// ToDo: handle image upload size, textfield response to image uplaod and database storage
