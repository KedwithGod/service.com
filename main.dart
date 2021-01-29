import 'package:flutter/material.dart';
import 'package:servicecom/Views/pageView/contactUs.dart';
import 'package:servicecom/Views/pageView/homePage.dart';


import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

import 'Models/loading.dart';
import 'Models/locator.dart';
import 'ViewModel/blocSettingsModel.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Text(snapshot.error.toString(), style: TextStyle(color:Colors.black),);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return  CircularProgressIndicator();
      },
    );
  }
}

class MyApp extends StatefulWidget {

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    mainBloc =
        MainBloc(); // initializing mainBloc. It will be availible to all widgets underdeath; that is All the app.
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service.com',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage()
    );
  }
}


