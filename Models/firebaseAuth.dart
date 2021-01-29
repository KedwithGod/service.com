import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:servicecom/Views/Uielements/Generaltextdisplay.dart';

import 'dateTime.dart';



class FirebaseService{
  var currentUserId;


  loginMethod(email,password,context) async {
    try{
      var authResult= await FirebaseAuth.instance.signInWithEmailAndPassword(email:
      email, password: password

      );
      User user= await FirebaseAuth.instance.currentUser;
      if( user.emailVerified){
        return user.uid;
      }
      else{
        return null;
      }

    }catch(e){
      return showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){
            return AlertDialog(
              backgroundColor: Colors.white,
              content: Text(e.toString(),style: TextStyle(color: Colors.black),),
              actions: [Text('Close', style: TextStyle(color:Color.fromRGBO(51, 51, 51, 1.0)),)],
            )
            ;});
    }
  }


  signUpMethod(email,password,context) async{
    try{
      var authResult= await FirebaseAuth.instance.createUserWithEmailAndPassword(email:
      email, password: password
      );
      User user=  FirebaseAuth.instance.currentUser;
      await user.sendEmailVerification();
      if(user.emailVerified){
        return user.uid;}
      else {return null;}

    }catch(e){
      return showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){
                return AlertDialog(
                  backgroundColor: Colors.white,
                  title: GeneralTextDisplay('Oops!', Color.fromRGBO(0, 0, 0, 1.0), 1, 15, FontWeight.w500, 'Sign up Error'),
                  content: Text(e.toString(),style: TextStyle(color: Colors.black),),
                  actions: [ Text('Close', style: TextStyle(color:Colors.black),)],
                )
            ;});

    }
  }
  Future signOut() async {
    try {
      return await FirebaseAuth.instance.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

}