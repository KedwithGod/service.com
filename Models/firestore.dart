import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dateTime.dart';






class FireStoreService{
  CollectionReference accounts= FirebaseFirestore.instance.collection('Business accounts');
  // a function to save all business details
  saveData(businessName,businessType,businessContact,
      mobileNumber,
      uploadBusinessCertificate,email,password,addedInfo,businessAddress,context,
      {locationLng='',locationLat='',country='',state=''}
      )async {
    try{await accounts.doc(email).set({
      'businessAddress':businessAddress,
      'businessName': businessName,
      'businessType':businessType,
      'businessContact':businessContact,
      'mobileNumber':mobileNumber,
      'locationLng':locationLng,
      'locationLat':locationLat,
      'Registration time':currentTime(),
      'Registration date':currentDate('full date'),
      'country':country,
      'state':state,
      'uploadBusinessCertificate':uploadBusinessCertificate,
      'email':email,
      'password':password,
      'addedInfo':addedInfo

    },);
    await FirebaseFirestore.instance.collection('Business numeric').doc('No of Business registered').set({
      'No of Business'
          : FieldValue.increment(1)},SetOptions(merge: true));

    }catch(e){
      return showDialog(
          context: context,
          barrierDismissible: true,
          builder: (context){
            return AlertDialog(
              backgroundColor: Colors.white,
              content: Text(e.toString(),style: TextStyle(color: Colors.black),),
              actions: [ Text('Close', style: TextStyle(color:Colors.black),)],
            )
            ;});
    }
  }

 // a function to get all business details
  getBusinessData(loginEmail){
    return accounts.doc(loginEmail).snapshots();
  }

 // a function to retrieve no of business registered
  noOfBusiness(){
    return  FirebaseFirestore.instance.collection('Business numeric').doc('No of Business registered').snapshots();
  }




}