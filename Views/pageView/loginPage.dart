import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:servicecom/Views/Uielements/Generalbuttondisplay.dart';
import 'package:servicecom/Views/Uielements/Generaltextdisplay.dart';
import 'package:servicecom/Views/Uielements/Generaltextfielddisplay.dart';
import 'package:servicecom/Views/pageView/homePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>with TickerProviderStateMixin {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();

  // animation variable
  int _loginIndex=0;
  int index=0;
  int homeIndex=0;
  AnimationController _controller;
  Animation _animation;

  // animation variable: animation list values
  Timer timer;
  Timer homeTimer;

  // home Timer

  _homeTimer(){
    homeTimer=Timer.periodic(Duration(milliseconds:100), (timer) {
      if(homeIndex<home.length-1){
        setState(() {
          homeIndex++;
        });
      }
      else if (homeIndex==home.length-1){
        homeTimer.cancel();
      }
    });
  }


  static List home =[-36,20];
  static List login =[867,867-590];
  static List subtitle=[931,931-590];
  static List emailField =[1016,1016-590];
  static List passwordField=[1087,1087-590];
  static List forgotPassword=[1153,1153-590];
  static List loginButton =[1192,1192-590];


// custom animation settings
  _customAnimation(){
    _controller= AnimationController(duration:Duration(milliseconds: 2000),vsync: this,);
    _animation=Tween(begin:0.0,end: 1.0).animate(CurvedAnimation(
      curve: Curves.decelerate,parent: _controller,));
    _controller.forward();
  }

// timer fuction
  _initTimer(){
    timer=Timer.periodic(Duration(milliseconds:100), (timer) {
      if(index<login.length-1){
        setState(() {
          index++;
        });
      }
      else if (index==login.length-1){
        timer.cancel();
      }
      _homeTimer();
    });
  }
  _reverseTimer(){
    timer=Timer.periodic(Duration(milliseconds:1000), (timer) {
      if(index==login.length-1){
        setState(() {
          index=0;
        });}

      if (index<login.length-1){
        timer.cancel();
      }
    });
  }
  @override
  void initState() {
   _initTimer();
   _customAnimation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
      width: 375,
      height:667,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/login.jpg'),
              fit: BoxFit.cover,alignment: Alignment.centerRight)
      ),
      child: Container(
          width: 375,
          height:667,
          color: Color.fromRGBO(0, 0, 0, 0.47),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
              left: home[homeIndex],
              top: 20,
              child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                  },
                  child: Icon(Icons.home,color: Colors.white, size: 24, )),
            ),
            Positioned(
              left: 81,
              top: 51,
              child: FadeTransition(
                key: ValueKey('loginTitle'),
                opacity:_animation,
                child: Container(
                  key:ValueKey('title'),
                  width: 175,
                  height: 56,
                  child: Stack(
                    children: [
                      Icon(Icons.strikethrough_s, size: 75,color: Color.fromRGBO(242, 187, 3, 1.0),
                          )
                      ,
                      Positioned(
                        left: 57,
                        top: 38,
                        child: Text('ERVICE.COM',
                          style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.w700,fontSize: 17, ),),

                      )
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              left: 33,
              top: 124,
              child: Container(
                width: 310,
                height: 34,
                child: GeneralTextDisplay(
                    '''Get 24 hours access to service around you from the comfort of your home.''', Color.fromRGBO(227, 203, 134, 1.0),
                    2, 12, FontWeight.w600, '_subtitle'),
              ),
            ),
            Positioned(
                top:186 ,
                left: 0,
                child:Container(
                  width: 375,
                  height: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
              Positioned(
                  left: 23,
                  top: 252,
                  child: RotationTransition(
                    turns: _animation,
                    child: Container(
                      width:330,
                      height: 402,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.28),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                  )),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 1000),
              switchInCurve: Curves.easeInOut,
              child: IndexedStack(
                index: _loginIndex,
                key: ValueKey(_loginIndex),
                children: [
                  Stack(
                    children: [
                      AnimatedPositioned(
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                        left: 43,
                        top: login[index],
                        child: GeneralTextDisplay(
                            'Log in', Color.fromRGBO(255, 255, 255, 1.0),
                            1, 20, FontWeight.w900, 'log in'),
                      ),
                      AnimatedPositioned(
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 1200),
                        left: 43,
                        top: subtitle[index],
                        child: GeneralTextDisplay(
                            'This is a secure system and you will need to \nprovide your login details to access your profile',
                            Color.fromRGBO(215, 215, 215, 1.0),
                            2, 13, FontWeight.w500, 'details'),
                      ),
                      AnimatedPositioned(
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 1350),
                        left:43 ,
                        top: emailField[index],
                        child: GeneralTextField(
                            TextInputType.text,
                            _emailController,
                            'Email',
                            'Enter Email Address',
                            'email',
                            1,
                            46,291),
                      ),
                      AnimatedPositioned(
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 1500),
                        left:43,
                        top: passwordField[index],
                        child: GeneralTextField(
                            TextInputType.text,
                            _passwordController,
                            'Password',
                            'Enter Password',
                            'email',
                            1,
                            46,291),
                      ),
                      AnimatedPositioned(
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 1700),
                        left: 213,
                        top: forgotPassword[index],
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              index=1;
                              _reverseTimer();
                              //give timer for the login to reverse animation
                              Future.delayed(Duration(milliseconds: 1400),(){
                                setState(() {
                                  _loginIndex=1;
                                });
                              });
                            });
                          },
                          child: GeneralTextDisplay(
                              'Forgot password?', Color.fromRGBO(167, 200, 90, 1.0),
                              1, 12, FontWeight.w500, 'forgot password'),
                        ),
                      ),
                      AnimatedPositioned(
                        curve: Curves.easeInOut,
                        duration: Duration(milliseconds: 1850),
                        left:43,
                        top:loginButton[index],
                        child: GeneralButton(
                            1,
                            'login button',
                            'Log in',
                            Color.fromRGBO(242, 154,35, 1.0),
                            12,
                            FontWeight.bold,
                            36,
                            291,
                                (){},
                            Colors.black,
                            Colors.black,
                            5.0),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Positioned(
                        left: 43,
                        top: 277,
                        child: GeneralTextDisplay(
                            'Reset password', Color.fromRGBO(255, 255, 255, 1.0),
                            1, 20, FontWeight.w900, 'Reset password'),
                      ),
                      Positioned(
                        left: 43,
                        top: 341,
                        child: GeneralTextDisplay(
                            "Please enter your credential first \nIt won't be shared publicly \nIt won't be spammed",
                            Color.fromRGBO(215, 215, 215, 1.0),
                            3, 13, FontWeight.w500, 'details'),
                      ),
                      Positioned(
                        left:43 ,
                        top: 439,
                        child: GeneralTextField(
                            TextInputType.text,
                            _emailController,
                            'Email',
                            'Enter Registered Email Address',
                            'email',
                            1,
                            46,291),
                      ),

                      Positioned(
                        left: 150,
                        top: 600,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              _loginIndex=0;
                              index=0;
                              _initTimer();
                            });
                          },
                          child: GeneralTextDisplay(
                              'Go to Log in page?', Color.fromRGBO(167, 200, 90, 1.0),
                              1, 12, FontWeight.w500, 'forgot password'),
                        ),
                      ),
                      Positioned(
                        left:43,
                        top:533,
                        child: GeneralButton(
                            1,
                            'Reset password',
                            'Reset password',
                            Color.fromRGBO(242, 154,35, 1.0),
                            12,
                            FontWeight.bold,
                            36,
                            291,
                                (){},
                            Colors.black,
                            Colors.black,
                            5.0),
                      )
                    ],
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    )));
  }
}
