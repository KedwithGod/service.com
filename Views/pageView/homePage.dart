import 'dart:async';

import 'package:flutter/material.dart';

import 'package:servicecom/ViewModel/baseModel.dart';
import 'package:servicecom/Views/Uielements/Generaltextdisplay.dart';
import 'package:servicecom/Views/pageView/searchResultPage.dart';
import 'package:stacked/stacked.dart';

import 'aboutPage.dart';
import 'addTradePage.dart';
import 'contactUs.dart';
import 'loginPage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int index = 0;
  Timer timer;
  static List serviceTitle = [-104, 267];
  static List textField = [425, 45];
  static List menu = [423, 313];
  static List tailorLine = [752, 420];
  static List painterLine = [793, 461];
  static List chefLine = [835, 503];
  static List decisionButton = [637, 270];

  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 1500), (timer) {
      if (index < serviceTitle.length - 1) {
        setState(() {
          index++;
        });
      } else if (index == serviceTitle.length - 1) {
        timer.cancel();
      }
    });

    super.initState();
  }

  Widget customDialog(double x, double y, color, child) {
    return Align(
      alignment: Alignment(x, y),
      child: Material(
        color: color,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        )),
        child: child,
      ),
    );
  }

  suggestionButton(double left, double top, double width, double height,
      String text, Color color, milliseconds, curve) {
    return AnimatedPositioned(
      key: ValueKey(text),
      left: left,
      top: top,
      duration: Duration(milliseconds: milliseconds),
      curve: curve,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(68))),
        child: GeneralTextDisplay(text, Color.fromRGBO(200, 200, 200, 1.0), 1,
            10, FontWeight.w600, text),
        alignment: Alignment.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.nonReactive(
        onModelReady: (model) {
          model.getLocation();
        },
        viewModelBuilder: () => BaseModel(),
        builder: (context, model, child) => Scaffold(
            resizeToAvoidBottomInset: true,
 body: SafeArea(
          child: Container(
            width: 375,
            height:667,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/welcomepage.jpg'),
                    fit: BoxFit.cover,alignment: Alignment.centerRight)
            ),
            child: Container(
              width: 375,
              height:667,
              color: Color.fromRGBO(0, 0, 0, 0.27),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 350),
                    curve: Curves.bounceIn,
                    left:textField[index],
                    top: 348,
                    child: SizedBox(
                        height: 50,
                        width: 285,
                        child: TextFormField(
                          autofocus: true,
                          key:ValueKey('textField'),
                          decoration: InputDecoration(
                              hintText:'Search for services in your location',
                              hintStyle: TextStyle(
                                  fontSize: 12,color: Colors.black,fontWeight: FontWeight.w400
                              ),
                              contentPadding: EdgeInsets.only(top: 2,bottom: 2,right: 2, left: 2),
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  model.storeSearchValue();
                                  model.newController.text.isNotEmpty?
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchPage())):null;
                                },
                                  child: Icon(Icons.search,color: Colors.black,)),
                              prefixIcon: Icon(Icons.mic,color: Colors.black,),

                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                  BorderRadius.circular(146)),
                              fillColor: Colors.white,
                              filled: true
                          ),
                          controller: model.newController,

                        )),
                  ),

                  suggestionButton(45,tailorLine[index], 82, 31, 'Tailor', Color.fromRGBO(0, 0, 0, 0.25),500,Curves.easeInOut),
                  suggestionButton(137, tailorLine[index], 92, 31, 'Automechanic', Color.fromRGBO(0, 0, 255, 0.25),650,Curves.easeInOut),
                  suggestionButton(239, tailorLine[index], 82, 31, 'Cake making', Color.fromRGBO(217, 0, 27, 0.25),800,Curves.easeInOut),
                  suggestionButton(45, painterLine[index], 82, 31, 'Painter', Color.fromRGBO(112, 182, 3, 0.25),950,Curves.easeInOut),
                  suggestionButton(137, painterLine[index], 92, 31, 'Data science', Color.fromRGBO(0, 255, 255, 0.25),1100,Curves.easeInOut),
                  suggestionButton(239, painterLine[index], 82, 31, 'Fan repairer', Color.fromRGBO(255, 255, 255, 0.25),1250,Curves.easeInOut),
                  suggestionButton(45, chefLine[index], 82, 31, 'Chef', Color.fromRGBO(184, 116, 26, 0.25),1400,Curves.easeInOut),
                  suggestionButton(137, chefLine[index], 92, 31, 'Designer', Color.fromRGBO(246, 120, 169, 0.25),1550,Curves.easeInOut),
                  suggestionButton(239, chefLine[index], 82, 31, 'Art work', Color.fromRGBO(255, 255, 0, 0.25),1700,Curves.easeInOut),
                  AnimatedPositioned(
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds:2650),
                    left: menu[index],
                    top: 22,
                    child: GestureDetector(
                      onTap:(){
                        showDialog(context: context,
                        builder:(context){
                          return customDialog(-0.70, -0.90, Colors.blueGrey[700],
                              Container(
                                width:150,
                                height:80,
                                key:ValueKey('menu'),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left:19 ,
                                      top: 17,
                                      child: Icon(Icons.headset_mic,color: Colors.yellow,
                                      size: 16,),
                                    ),
                                    Positioned(
                                      left:19 ,
                                      top: 45,
                                      child:Icon(Icons.info, color: Colors.green,size: 16,) ,

                                    ),
                                    Positioned(
                                      left:45 ,
                                      top: 17,
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ContactUs()));
                                        },
                                        child: GeneralTextDisplay('Contact Us', Color.fromRGBO(242, 242, 242, 1.0),1, 12,
                                            FontWeight.bold, 'contact us'),
                                      ),
                                    ), Positioned(
                                      left:45 ,
                                      top: 45,
                                      child: GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                              AboutPage()));
                                        },
                                        child: GeneralTextDisplay('About Us', Color.fromRGBO(242, 242, 242, 1.0),1, 12,
                                            FontWeight.bold, 'about us'),
                                      ),
                                    ),

                                  ],
                                ),
                              ));
                        });
                      },
                        child: Icon(Icons.menu, size: 40,color: Color.fromRGBO(242, 242, 242, 1.0),
                        key: ValueKey(menu[index]),)),
                  ),

                  AnimatedPositioned(
                    duration: Duration(seconds:1),
                    curve: Curves.easeInOut,
                    left: 97,
                    top:serviceTitle[index] ,
                    child: Container(
                      key:ValueKey('title'),
                      width: 175,
                      height: 56,
                      child: Stack(
                        children: [
                          Icon(Icons.strikethrough_s, size: 75,color: Color.fromRGBO(242, 187, 3, 1.0),
                          key:ValueKey(serviceTitle[index])
                          ),
                          Positioned(
                            left: 57,
                            top: 38,
                            child: Text('ERVICE.COM',key: ValueKey(serviceTitle[index]+1),
                              style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.w700,fontSize: 17, ),),

                          )
                        ],
                      ),
                    ),
                  ),

                  AnimatedPositioned(
                    duration: Duration(milliseconds: 2650),
                    left: decisionButton[index],
                    top: 620,
                    child: Container(
                      width:80,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 0, 100, 0.10),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()))
;                              },
                              child: Icon(Icons.edit, size: 17,color: Color.fromRGBO(255, 255, 0, 1.0),)),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTrade()));
                              },
                              child: Icon(Icons.add, size: 20,color: Color.fromRGBO(255, 255, 0, 1.0),)),
                        ],
                      )
                  )),

                ],
              ),
            ),
          ),
        )
        ));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}


