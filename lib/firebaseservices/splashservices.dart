import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_2/ui/authentication/login_screen.dart';
import 'package:fyp_2/ui/post_screens/postscreen.dart';

class splashservices{
  void islogin(BuildContext context){
    final auth=FirebaseAuth.instance;
    final user=auth.currentUser;
    if(user!=null){
      Timer(Duration(seconds: 14),
              ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>postscreen())));
    }
    else{
      Timer(Duration(seconds: 3),
              ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>loginscreen())));
    }

  }
}