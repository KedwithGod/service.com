import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:servicecom/Views/Uielements/Generalbuttondisplay.dart';
import 'package:servicecom/Views/Uielements/Generaltextdisplay.dart';
import 'package:servicecom/Views/Uielements/Generaltextfielddisplay.dart';
import 'package:servicecom/Views/pageView/profilePage.dart';

import 'addTradePage.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> with TickerProviderStateMixin {

  // animation variable
  AnimationController _controller;
  Animation _animation;
  AnimationController _listController;
  Animation _listAnimation;
  AnimationController _stackController;
  Animation _stackAnimation;

  // custom animation settings
  _customAnimation(){
    _controller= AnimationController(duration:Duration(milliseconds: 1500),vsync: this,);
    _animation=Tween(begin:0.0,end: 1.0).animate(CurvedAnimation(
      curve: Curves.easeInCubic,parent: _controller,));
    _controller.forward();
    _listController= AnimationController(duration:Duration(milliseconds: 2000),vsync: this,);
    _listAnimation=Tween(begin:0.0,end: 1.0).animate(CurvedAnimation(
      curve: Curves.elasticIn,parent: _listController,));
    _listController.forward();
    _stackController= AnimationController(duration:Duration(milliseconds: 2500),vsync: this,);
    _stackAnimation=Tween(begin:0.0,end: 1.0).animate(CurvedAnimation(
      curve: Curves.slowMiddle,parent: _stackController,));
    _stackController.forward();
  }


  int _editIndex=0;
  TextEditingController _businessContact=TextEditingController();
  TextEditingController _mobileNumber=TextEditingController();
  TextEditingController _country=TextEditingController();
  TextEditingController _state=TextEditingController();
  TextEditingController _anyOther=TextEditingController();
  TextEditingController _uploadBusiness=TextEditingController();
  TextEditingController _emailAddress=TextEditingController();
  // to update the circle sizes a they are clicked on

  List<ListItem> _dropdownItems = [
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item")
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  ListItem _selectedItem;

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
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
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
    _selectedItem = _dropdownMenuItems[0].value;
    _customAnimation();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
      body:SafeArea(
        child:Container(
        width: 375,
        height:667,
        decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/anothrimapge4.jpg'),
    fit: BoxFit.cover,alignment: Alignment.centerRight)
    ),
    child: Container(
    width: 375,
    height:667,
    color: Color.fromRGBO(0, 0, 0, 0.47),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 70,
            child: SlideTransition(
              position: Tween(
                  begin: Offset(0, -1),
                  end:Offset(0,0)
              ).animate(_animation),
              child: Container(
                width: 375,
                height: 68,
                alignment: Alignment.center,
                child: GeneralTextDisplay('SoftSolution company',
                    Colors.white, 1, 30, FontWeight.bold, 'SoftSolution company'),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 117,
            child: SlideTransition(
              position: Tween(
                  begin: Offset(0, -1),
                  end:Offset(0,0)
              ).animate(_animation),
              child: Container(
                width: 375,
                height: 48,
                alignment: Alignment.center,
                child: GeneralTextDisplay(
                    'Software company',
                    Color.fromRGBO(245, 154, 35,1.0), 1, 20, FontWeight.bold, 'Software company'),
              ),
            ),

          ),
          Positioned(
            left: 0,
            top: 177,
            child:SlideTransition(
              position: Tween(
                  begin: Offset(-1, 0),
                  end:Offset(0,0)
              ).animate(_listAnimation),
              child: SizedBox(
                width:375,
                height: 67,
                child: ListView(
                  shrinkWrap: false,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(width:25),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _editIndex=0;
                        });
                      },
                      child: Container(
                        width: _editIndex==0?55:45,
                        height: _editIndex==0?55:45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(50, 12, 220, 1.0)
                        ),
                        child: Icon(Icons.phone,color: Colors.white,size: _editIndex==0?33:23,),
                      ),
                    ),
                    SizedBox(width:20),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _editIndex=1;
                        });
                      },
                      child: Container(
                        width: _editIndex==1?55:45,
                        height: _editIndex==1?55:45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(217, 0, 27, 1.0)
                        ),
                        child: Icon(Icons.phone_android,color: Colors.white,size: _editIndex==1?33:23,),
                      ),
                    ),
                    SizedBox(width:20),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _editIndex=2;
                        });
                      },
                      child: Container(
                        width: _editIndex==2?55:45,
                        height: _editIndex==2?55:45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(0, 150, 0, 1.0)
                        ),
                        child: Icon(Icons.mail,color: Colors.white,size: _editIndex==2?33:23,),
                      ),
                    ),
                    SizedBox(width:20),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _editIndex=3;
                        });
                      },
                      child: Container(
                        width: _editIndex==3?55:45,
                        height: _editIndex==3?55:45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(99, 0, 191, 1.0)
                        ),
                        child: Icon(Icons.location_on,color: Colors.white,size: _editIndex==3?33:23),
                      ),
                    ),
                    SizedBox(width:20),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _editIndex=4;
                        });
                      },
                      child: Container(
                        width: _editIndex==4?55:45,
                        height: _editIndex==4?55:45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(123, 77, 18, 1.0)
                        ),
                        child: Icon(Icons.wallpaper,color: Colors.white,size: _editIndex==4?33:23),
                      ),
                    ),
                    SizedBox(width:20),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _editIndex=5;
                        });
                      },
                      child: Container(
                        width: _editIndex==5?55:45,
                        height: _editIndex==5?55:45,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(255,255, 255, 0.15)
                        ),
                        child: Icon(Icons.add,color: Colors.white,size: _editIndex==5?33:23),
                      ),
                    ),
                    SizedBox(width:20),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left:0,
            top:261,
            child:Container(
                height: 1,
              width: 375,

              color:Colors.white
            )
          ),
          Positioned(
            left:27,
            top: 291,
            child:FutureBuilder( // the future builder is used to hide the text widget for 1seconds before displaying it
                future: Future.delayed(Duration(milliseconds: 1000)),
                builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Container();
                  }
                return SlideTransition(
                  position: Tween(
                      begin: Offset(0, 1),
                      end:Offset(0,0)
                  ).animate(_stackAnimation),
                  child: AnimatedSwitcher(
                    switchInCurve: Curves.easeInOut,
                    duration: Duration(milliseconds: 2000),
                    child: IndexedStack(
                      index:_editIndex,
                      key: ValueKey(_editIndex),
                      children: [
                        Container(
                          width: 323,
                          height: 323,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.28),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Stack(
                            children: [
                              Positioned(
                              left:0 ,
                              top: 10,
                              child: Container(
                                width: 323,
                                height: 24,
                                alignment: Alignment.center,
                                child: GeneralTextDisplay(
                                    'Business Contact',
                                    Color.fromRGBO(255, 255, 255, 1.0),
                                    1,
                                    20,
                                    FontWeight.w500,
                                    'Work No.'),
                              )),
                                   Positioned(
                        left:16 ,
                        top: 60,
                        child: GeneralTextField(
                            TextInputType.text,
                            _businessContact,
                            'Phone Number',
                            'Enter your new business phone number ',
                            'name',
                            1,
                            46,291),
                      ),
                              Positioned(
                                left:16,
                                top:136,
                                child: GeneralButton(
                                    1,
                                    'Save',
                                    'Save',
                                    Colors.white,
                                    18,
                                    FontWeight.w400,
                                    40,
                                    291,
                                        (){
                                          setState(() {
                                            _editIndex=1;
                                          });
                                    },
                                    Color.fromRGBO(50, 12,220, 1.0),
                                    Color.fromRGBO(50, 12,220, 1.0),
                                    5.0),
                              ),
                              Positioned(
                                left:16,
                                top:196,
                                child: GeneralButton(
                                    1,
                                    'Exit',
                                    'Exit',
                                    Colors.white,
                                    18,
                                    FontWeight.w500,
                                    40,
                                    291,
                                        (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                                    },
                                    Colors.transparent,
                                    Colors.black,
                                    5.0),
                              )

                            ],
                          ),
                        ),
                        Container(
                          width: 323,
                          height: 323,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.28),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Stack(
                            children: [
                              Positioned(
                              left:0 ,
                              top: 10,
                              child: Container(
                                width: 323,
                                height: 24,
                                alignment: Alignment.center,
                                child: GeneralTextDisplay(
                                    'Business Contact',
                                    Color.fromRGBO(255, 255, 255, 1.0),
                                    1,
                                    20,
                                    FontWeight.w500,
                                    'mobile number'),
                              )),
                                   Positioned(
                        left:16 ,
                        top: 60,
                        child: GeneralTextField(
                            TextInputType.text,
                            _mobileNumber,
                            'Mobile Number',
                            'Enter your new business mobile number ',
                            'name',
                            1,
                            46,291),
                      ),
                              Positioned(
                                left:16,
                                top:136,
                                child: GeneralButton(
                                    1,
                                    'Save',
                                    'Save',
                                    Colors.white,
                                    18,
                                    FontWeight.w400,
                                    40,
                                    291,
                                        (){
                                          setState(() {
                                            _editIndex=2;
                                          });
                                    },
                                    Color.fromRGBO(217, 0,27, 1.0),
                                    Color.fromRGBO(217, 0,27, 1.0),
                                    5.0),
                              ),
                              Positioned(
                                left:16,
                                top:196,
                                child: GeneralButton(
                                    1,
                                    'Exit',
                                    'Exit',
                                    Colors.white,
                                    18,
                                    FontWeight.w500,
                                    40,
                                    291,
                                        (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                                    },
                                    Colors.transparent,
                                    Colors.black,
                                    5.0),
                              )

                            ],
                          ),
                        ),
                        Container(
                          width: 323,
                          height: 323,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.28),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Stack(
                            children: [
                              Positioned(
                              left:0 ,
                              top: 10,
                              child: Container(
                                width: 323,
                                height: 24,
                                alignment: Alignment.center,
                                child: GeneralTextDisplay(
                                    'Email Address',
                                    Color.fromRGBO(255, 255, 255, 1.0),
                                    1,
                                    20,
                                    FontWeight.w500,
                                    'Email Address'),
                              )),
                                   Positioned(
                        left:16 ,
                        top: 60,
                        child: GeneralTextField(
                            TextInputType.text,
                            _emailAddress,
                            'Email Address',
                            'Enter your new business email',
                            'name',
                            1,
                            46,291),
                      ),
                              Positioned(
                                left:16,
                                top:136,
                                child: GeneralButton(
                                    1,
                                    'Save',
                                    'Save',
                                    Colors.white,
                                    18,
                                    FontWeight.w400,
                                    40,
                                    291,
                                        (){
                                          setState(() {
                                            _editIndex=3;

                                          });
                                    },
                                    Color.fromRGBO(0, 150,0, 1.0),
                                    Color.fromRGBO(0, 150,0, 1.0),
                                    5.0),
                              ),
                              Positioned(
                                left:16,
                                top:196,
                                child: GeneralButton(
                                    1,
                                    'Exit',
                                    'Exit',
                                    Colors.white,
                                    18,
                                    FontWeight.w500,
                                    40,
                                    291,
                                        (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                                    },
                                    Colors.transparent,
                                    Colors.black,
                                    5.0),
                              )

                            ],
                          ),
                        ),
                        Container(
                          width: 323,
                          height: 367,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.28),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Stack(
                            children: [
                              Positioned(
                              left:0 ,
                              top: 10,
                              child: Container(
                                width: 323,
                                height: 24,
                                alignment: Alignment.center,
                                child: GeneralTextDisplay(
                                    'Business Location',
                                    Color.fromRGBO(255, 255, 255, 1.0),
                                    1,
                                    20,
                                    FontWeight.w500,
                                    '_location.'),
                              )),
                              Positioned(
                                left:16,
                                top: 54,
                                child: GeneralTextField(
                                  // TO DO: add a search box suggestion to this using flutter search delegate
                                    TextInputType.text,
                                    _country,
                                    'Country',
                                    'Select Country',
                                    'name',
                                    1,
                                    46,291),
                              ),
                              Positioned(
                                left:15 ,
                                top: 122,
                                child: GeneralTextField(
                                  // TO DO: add a search box suggestion to this using flutter search delegate
                                    TextInputType.text,
                                    _state,
                                    'State',
                                    'Select State',
                                    'name',
                                    1,
                                    46,291),
                              ),
                              Positioned(
                                left:16 ,
                                top: 190,
                                child: Container(
                                  width: 291,
                                  height: 46,
                                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),

                                      border: Border.all(
                                          color: Colors.white
                                      )),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                        dropdownColor:  Color.fromRGBO(99, 0,191, 1.0),
                                        iconEnabledColor:  Colors.white,
                                        value: _selectedItem,
                                        items: _dropdownMenuItems,
                                        onChanged: (value) {
                                          setState(() {
                                            _selectedItem = value;
                                          });
                                        }),
                                  ),
                                ),
                              ),
                              Positioned(
                                left:16,
                                top:261,
                                child: GeneralButton(
                                    1,
                                    'Save',
                                    'Save',
                                    Colors.white,
                                    18,
                                    FontWeight.w400,
                                    40,
                                    291,
                                        (){
                                          setState(() {
                                            _editIndex=4;
                                          });
                                    },
                                    Color.fromRGBO(99, 0,191, 1.0),
                                    Color.fromRGBO(99, 0,191, 1.0),
                                    5.0),
                              ),
                              Positioned(
                                left:16,
                                top:321,
                                child: GeneralButton(
                                    1,
                                    'Exit',
                                    'Exit',
                                    Colors.white,
                                    18,
                                    FontWeight.w500,
                                    40,
                                    291,
                                        (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                                    },
                                    Colors.transparent,
                                    Colors.black,
                                    5.0),
                              )

                            ],
                          ),
                        ),
                        Container(
                          width: 323,
                          height: 323,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.28),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Stack(
                            children: [
                              Positioned(
                              left:0 ,
                              top: 10,
                              child: Container(
                                width: 323,
                                height: 24,
                                alignment: Alignment.center,
                                child: GeneralTextDisplay(
                                    'Business Certificate',
                                    Color.fromRGBO(255, 255, 255, 1.0),
                                    1,
                                    20,
                                    FontWeight.w500,
                                    'business certificate'),
                              )),
                                   Positioned(
                        left:16 ,
                        top: 60,
                        child: GeneralTextField(
                            TextInputType.text,
                            _uploadBusiness,
                            'Registration Certificate',
                            'Upload your business certificate',
                            'name',
                            1,
                            46,291),
                      ),
                              Positioned(
                                left:16,
                                top:136,
                                child: GeneralButton(
                                    1,
                                    'Save',
                                    'Save',
                                    Colors.white,
                                    18,
                                    FontWeight.w400,
                                    40,
                                    291,
                                        (){
                                          setState(() {
                                            _editIndex=5;
                                          });
                                    },
                                    Color.fromRGBO(123, 77,18, 1.0),
                                    Color.fromRGBO(123, 77,18, 1.0),
                                    5.0),
                              ),
                              Positioned(
                                left:16,
                                top:196,
                                child: GeneralButton(
                                    1,
                                    'Exit',
                                    'Exit',
                                    Colors.white,
                                    18,
                                    FontWeight.w500,
                                    40,
                                    291,
                                        (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                                    },
                                    Colors.transparent,
                                    Colors.black,
                                    5.0),
                              )

                            ],
                          ),
                        ),
                        Container(
                          width: 323,
                          height: 323,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.28),
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          child: Stack(
                            children: [
                              Positioned(
                              left:0 ,
                              top: 10,
                              child: Container(
                                width: 323,
                                height: 24,
                                alignment: Alignment.center,
                                child: GeneralTextDisplay(
                                    'Added Information',
                                    Color.fromRGBO(255, 255, 255, 1.0),
                                    1,
                                    20,
                                    FontWeight.w500,
                                    'added info'),
                              )),
                                   Positioned(
                        left:16 ,
                        top: 60,
                        child: GeneralTextField(
                            TextInputType.text,
                            _anyOther,
                            'Added information',
                            'What else do we need in your business',
                            'name',
                            1,
                            46,291),
                      ),
                              Positioned(
                                left:16,
                                top:136,
                                child: GeneralButton(
                                    1,
                                    'Save',
                                    'Save',
                                    Colors.white,
                                    18,
                                    FontWeight.w400,
                                    40,
                                    291,
                                        (){
                                          setState(() {
                                            _editIndex=0;
                                          });
                                    },
                                    Color.fromRGBO(127,127,127, 1.0),
                                    Color.fromRGBO(127,127,127,  1.0),
                                    5.0),
                              ),
                              Positioned(
                                left:16,
                                top:196,
                                child: GeneralButton(
                                    1,
                                    'Exit',
                                    'Exit',
                                    Colors.white,
                                    18,
                                    FontWeight.w500,
                                    40,
                                    291,
                                        (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
                                    },
                                    Colors.transparent,
                                    Colors.black,
                                    5.0),
                              )

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            ),
          )
        ],
      ),
      )
    )));
  }
}
