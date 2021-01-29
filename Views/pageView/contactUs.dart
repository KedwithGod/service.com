import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:servicecom/Views/Uielements/Generaltextdisplay.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  int titleIndex=0;
  Timer titleTimer;

  // home Timer

  _homeTimer(){
    titleTimer=Timer.periodic(Duration(milliseconds:100), (timer) {
      if(titleIndex<title.length-1){
        setState(() {
          titleIndex++;
        });
      }
      else if (titleIndex==title.length-1){
        titleTimer.cancel();
      }
    });
  }


  static List title =[704,188];
  static List contactIcon =[825,314];
  static List contact=[821,311];
  static List addressIcon =[876,366];
  static List address=[871,366];
  static List companyName=[768,258];
  static List companyIcon =[768,258];
  static List socialIcon=[933,423];

  void initState() {
    super.initState();
    _homeTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: 375,
        height: 667,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/contactus2.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.centerLeft)),
        child: Container(
          width: 375,
          height: 667,
          color: Color.fromRGBO(0, 0, 0, 0.47),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                left: 101,
                top: title[titleIndex],
                child: GeneralTextDisplay('Contact us', Colors.white, 1, 30,
                    FontWeight.w500, 'contact page title'),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 1100),
                curve: Curves.easeInOut,
                left: 100,
                top: companyName[titleIndex],
                child: GeneralTextDisplay('Softsolution.gmail.com', Colors.white, 1, 15,
                    FontWeight.w400, 'contact page item 1'),
              ),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                left: 37,
                top: companyIcon[titleIndex],
                child: Icon(Icons.work,color: Color.fromRGBO(255, 255, 0, 1.0),size: 25)
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 1400),
                curve: Curves.easeInOut,
                left: 101,
                top: contact[titleIndex],
                child: GeneralTextDisplay('09084657873, 012347566', Colors.white, 1, 15,
                    FontWeight.w400, 'contact page item 2'),
              ),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 1400),
                  curve: Curves.easeInOut,
                  left: 37,
                  top: contactIcon[titleIndex],
                  child: Icon(Icons.phone,color: Color.fromRGBO(255, 255, 0, 1.0),size: 25)
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 1700),
                curve: Curves.easeInOut,
                left: 101,
                top: address[titleIndex],
                child: Container(
                  width: 261,
                  height: 36,

                  child: GeneralTextDisplay('Shop 33, Aluta market, Futa North gate,Akure, Ondo state, Nigeria', Colors.white, 2, 15,
                      FontWeight.w400, 'contact page item 3'),
                ),
              ),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 1700),
                  curve: Curves.easeInOut,
                  left: 37,
                  top: addressIcon[titleIndex],
                  child: Icon(Icons.location_city,color: Color.fromRGBO(255, 255, 0, 1.0),size: 25)
              ),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.easeInOut,
                  top:socialIcon[titleIndex] ,
                  left: 70,
                  child:Container(
                    width: 375,
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SignInButton(
                          Buttons.Facebook,
                          mini: true,
                          onPressed: () {},
                        ),
                        SizedBox(width: 40,),
                        SignInButton(
                          Buttons.Twitter,
                          mini: true,
                          onPressed: () {},
                        ),SizedBox(width: 40,),SignInButton(
                          Buttons.LinkedIn,
                          mini: true,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ) ),
            ],
          ),
        ),
      ),
    ));
  }
}
