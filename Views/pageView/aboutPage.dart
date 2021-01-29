import 'package:flutter/material.dart';
import 'package:servicecom/Views/Uielements/Generaltextdisplay.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  // animation variable
  AnimationController _titleController,_visionController, _visionFieldController,_missionController,_missionFieldController;
  Animation _titleAnimation,_visionAnimation, _visionFieldAnimation,_missionAnimation,_missionFieldAnimation;


  // custom animation settings
  _customAnimation(){
    _titleController= AnimationController(duration:Duration(milliseconds: 1000),vsync: this,);
    _titleAnimation=Tween(begin:0.0,end: 1.0).animate(CurvedAnimation(
      curve: Curves.easeIn,parent: _titleController,));
    _titleController.forward();
    _visionController= AnimationController(duration:Duration(milliseconds: 700),vsync: this,);
    _visionAnimation=Tween(begin:0.0,end: 1.0).animate(CurvedAnimation(
      curve: Curves.easeIn,parent: _visionController,));
    Future.delayed(Duration(milliseconds: 1000),(){
      _visionController.forward();
    });

    _visionFieldController= AnimationController(duration:Duration(milliseconds: 700),vsync: this,);
    _visionFieldAnimation=Tween(begin:0.0,end: 1.0).animate(CurvedAnimation(
      curve: Curves.easeIn,parent: _visionFieldController,));
    Future.delayed(Duration(milliseconds: 2000),(){
      _visionFieldController.forward();
    });
    _missionController= AnimationController(duration:Duration(milliseconds: 700),vsync: this,);
    _missionAnimation=Tween(begin:0.0,end: 1.0).animate(CurvedAnimation(
      curve: Curves.easeIn,parent: _missionController,));
    Future.delayed(Duration(milliseconds: 3000),(){
      _missionController.forward();
    });
    _missionFieldController= AnimationController(duration:Duration(milliseconds: 700),vsync: this,);
    _missionFieldAnimation=Tween(begin:0.0,end: 1.0).animate(CurvedAnimation(
      curve: Curves.easeIn,parent: _missionFieldController,));
   ;Future.delayed(Duration(milliseconds: 4000),(){
      _missionFieldController.forward();
    });
  }

  void initState() {
    super.initState();
    _customAnimation();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: 375,
        height:667,
        decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(
            'assets/aboutPage.jpg'),
    fit: BoxFit.cover,alignment: Alignment.center)
    ),
    child: Container(
    width: 375,
    height:667,
    color: Color.fromRGBO(0, 0, 0, 0.47),
      child:Stack(
        children:[
          Positioned(
            left:34 ,
            top: 51,
            child: SlideTransition(
      position: Tween(
      begin: Offset(-1, 0),
        end:Offset(0,0)
    ).animate(_titleAnimation),
              child: GeneralTextDisplay('SoftSolution Company',Colors.white
                  ,1,
                        30,FontWeight.bold, 'aboutPage title'),
            ),
                ),
          Positioned(
            left:159 ,
            top: 115,
            child: FutureBuilder( // the future builder is used to hide the text widget for 1seconds before displaying it
              future: Future.delayed(Duration(milliseconds: 1000)),
              builder: (context, snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return Container();
                }
                return SlideTransition(
                  position: Tween(
                      begin: Offset(0, 1),
                      end:Offset(0,0)
                  ).animate(_visionAnimation),
                  child: GeneralTextDisplay(
                      'Vision',Color.fromRGBO(255, 255, 0, 1.0)
                      ,1,
                            20,FontWeight.w500, 'aboutPage vision'),
                );
              }
            ),
                ),Positioned(
            left:21 ,
            top: 159,
            child: FutureBuilder(
                future: Future.delayed(Duration(milliseconds: 2000)),
                builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Container();
                  }
                return Container(
                  width: 342,
                  height: 74,
                  child: SlideTransition(
                    position: Tween(
                        begin: Offset(1, 1),
                        end:Offset(0,0)
                    ).animate(_visionFieldAnimation),
                    child: GeneralTextDisplay(
                        'Solve problems that improve the standard of living of man around the whole world using mobile application, desktop and web applications',Colors.white
                        ,4,
                              16,FontWeight.w500, 'aboutPage subtitle'),
                  ),
                );
              }
            ),
                ),Positioned(
            left:150,
            top: 258,
            child: FutureBuilder(
                future: Future.delayed(Duration(milliseconds: 3000)),
              builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Container();
                  }
                return SlideTransition(
                  position: Tween(
                      begin: Offset(0, 1),
                      end:Offset(0,0)
                  ).animate(_missionAnimation),
                  child: GeneralTextDisplay(
                      'Mission',Color.fromRGBO(255, 255, 0, 1.0)
                      ,1,
                            20,FontWeight.w500, 'aboutPage mission'),
                );
              }
            ),
                ),Positioned(
            left:16 ,
            top: 296,
            child:FutureBuilder(
            future: Future.delayed(Duration(milliseconds: 4000)),
    builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
              return Container();}
                return SlideTransition(
                  position: Tween(
                      begin: Offset(-1, 1),
                      end:Offset(0,0)
                  ).animate(_missionFieldAnimation),
                  child: Container(
                    width: 342,
                    height: 148,
                    child: GeneralTextDisplay('1. Open for freelancing business to ensure the application produced both solve problem, add value to the users \n2. Open for long term and short term projects. \n3. Ensure consistency and reliability of all our products.'
                        ,Colors.white
                        ,6,
                              16,FontWeight.w500, 'aboutPage mission body'),
                  ),
                );
              }
            ),
                ),

        ]
      )
          )),
    ));
  }
}
