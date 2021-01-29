import 'dart:async';
import 'package:flutter/material.dart';
import 'package:servicecom/Views/Uielements/Generaltextdisplay.dart';
import 'package:servicecom/Views/pageView/editProfilePage.dart';
import 'homePage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  // animated position widget variables
  List containerAnimation=[750,25];
  int containerIndex=0;

  //timer variable
  Timer timer;
  // timer for animated position widget
  _initTimer(){
    timer=Timer.periodic(Duration(milliseconds:100), (timer) {
      if(containerIndex<containerAnimation.length-1){
        setState(() {
          containerIndex++;
        });
      }
      else if (containerIndex==containerAnimation.length-1){
        timer.cancel();
      }
    });
  }
  @override
  void initState() {
    _initTimer();
    super.initState();
  }

  // custom dialog
  Widget customDialog(double x,double y,width,height, color,child) {
    return Align(
      alignment: Alignment(x, y),
      child: SizedBox(
        width: width,
        height: height,
        child: Material(
          color: color,
          shape:
          RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight:Radius.circular(20),
            bottomLeft: Radius.circular(20), )),
          child: Align(
              alignment: Alignment.center,
              child: child
          ),

        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
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
        child:
        Stack(
          children: [
        AnimatedPositioned(duration:Duration(
        seconds: 2
        ),
        curve: Curves.easeInOut,

        top: containerAnimation[containerIndex],

        child: Container(
                  width: 375,
                  height:667,
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
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile()));
                                  },
                                  child: Icon(Icons.edit, size: 20,color:
                                  Colors.white)),),
                          Positioned(
                          left: 30,
                          top: 97,
                          child: GeneralTextDisplay('SoftSolution company',
                          Colors.white, 1, 30, FontWeight.bold, 'SoftSolution company'),
                          ),
                          Positioned(
                            left: 98,
                            top: 146,
                            child: Container(
                              width: 334,
                              height: 68,
                              child: GeneralTextDisplay(
                                  'Software company',
                                  Color.fromRGBO(245, 154, 35,1.0), 1, 20, FontWeight.bold, 'Software company'),
                            ),

                          ),
                            Positioned(
                                left:0,
                              top: 220,
                              child: Container(
                                width: 375,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                   GestureDetector(
                                     onTap: (){
                                       showDialog(context: context,
                                         builder: (context){
                                         return customDialog(-0.88, -0.15,281,56,Color.fromRGBO(50, 12, 220, 1.0),
                                         GeneralTextDisplay('09021345868', Colors.white, 1,
                                             17, FontWeight.w600, 'mobile number')
                                         );
                                         }
                                       );
                                     },
                                     child: Container(
                                        width: 67,
                                        height: 67,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(50, 12, 220, 1.0)
                                        ),
                                        child: Icon(Icons.phone,color: Colors.white,size: 30,),
                                      ),
                                   ),
                                    GestureDetector(
                                      onTap: (){
                                        showDialog(context: context,
                                            builder: (context){
                                              return customDialog(-0.88, -0.15,281,56,
                                                  Color.fromRGBO(217, 0, 27, 1.0),
                                                  GeneralTextDisplay('09021345868', Colors.white, 1,
                                                      17, FontWeight.w600, 'phone no')
                                              );
                                            }
                                        );
                                      },
                                      child: Container(
                                        width: 67,
                                        height: 67,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(217, 0, 27, 1.0)
                                        ),
                                        child: Icon(Icons.phone_android,color: Colors.white,size: 37,),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        showDialog(context: context,
                                            builder: (context){
                                              return customDialog(-0.95, -0.15,311,56,
                                                  Color.fromRGBO(0, 150, 0, 1.0),
                                                  GeneralTextDisplay('jayeolaakungbasunsun@yahoo.com', Colors.white, 1,
                                                      17, FontWeight.w600, 'mail')
                                              );
                                            }
                                        );
                                      },
                                      child: Container(
                                        width: 67,
                                        height: 67,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(0, 150, 0, 1.0)
                                        ),
                                        child: Icon(Icons.mail,color: Colors.white,size: 30,),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                left:0,
                              top: 340,
                              child: Container(
                                width: 375,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [

                                    GestureDetector(
                                      onTap: (){
                                        showDialog(context: context,
                                            builder: (context){
                                              return customDialog(-0.95, -0.15,340,160,
                                                  Color.fromRGBO(99, 0, 191, 1.0),
                                                  Text('No 22 alejolowo street, opposite ejigbo street ifon alaye, Osun state, NIgeria',
                                                    maxLines: 4,
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                    color: Colors.white,fontWeight:FontWeight.w600,fontSize:17,
                                                  ),)

                                              );
                                            }
                                        );
                                      },
                                     child: Container(
                                        width: 67,
                                        height: 67,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(99, 0, 191, 1.0)
                                        ),
                                        child: Icon(Icons.location_on,color: Colors.white,size: 37,),
                                      ),
                                   ),
                                    GestureDetector(
                                      onTap: (){
                                        showDialog(context: context,
                                            builder: (context){
                                              return customDialog(-0.95, -0.85,340,616,
                                                  Color.fromRGBO(255, 255, 255, 1.0),
                                                  Image.asset('assets/smart-city-with-checkpoints-communication-network_28943-371.jpg',
                                                  fit: BoxFit.cover,)
                                              );
                                            }
                                        );
                                      },
                                      child: Container(
                                        width: 67,
                                        height: 67,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(123, 77, 18, 1.0)
                                        ),
                                        child: Icon(Icons.wallpaper,color: Colors.white,size: 37,),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        showDialog(context: context,
                                            builder: (context){
                                              return customDialog(-0.95, -0.15,340,160,
                                                  Color.fromRGBO(255,255, 255, 0.15),
                                                  GeneralTextDisplay('This are additional information', Colors.white, 1,
                                                      17, FontWeight.w600, 'additional information')
                                              );
                                            }
                                        );
                                      },
                                      child: Container(
                                        width: 67,
                                        height: 67,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(255,255, 255, 0.15)
                                        ),
                                        child: Icon(Icons.add,color: Colors.white,size: 37,),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 30,
                                top: 534,
                                child: Container(
                              width: 342,
                              height: 120,
                              child: GeneralTextDisplay('This is your profile page, inspect to check if \nyour details are correct if not click edit button \nat the top right corner of this page. These \ninformation will be displayed to people who \nsearch for a service related to your company.',
                              Colors.white,
                              5,
                             15,
                              FontWeight.w400,
                              'profile value',
                              style:FontStyle.italic ,),
                            ))
                          ],
                  ),
                ),
            ),
          ],
        ),
      ),
              ),

      ),

    );
  }
}
