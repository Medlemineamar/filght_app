import 'package:flutter/material.dart';

class AppConstants {
  
  
  static const  appIcon = RotationTransition(
turns:  AlwaysStoppedAnimation(45 / 360),
child: Icon(Icons.flight , size: 70,),
) ;


  //======== COLORS =============
  static const primaryColor = Color.fromRGBO(0, 68, 165,1);
  static const secondColor = Colors.blue;
  static const buttonColor = Color(0xFFFFE4C7);

  static getInputDecoration(String lable){
    return InputDecoration(
                                                          focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white), // Bottom border color when focused
                                                ),
                                                enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white), // Bottom border color when not focused
                                                ),
                                                labelText: lable,labelStyle: TextStyle(
                                                color: Colors.white,fontSize: 15,fontWeight: FontWeight.w600,
                                                
                                              ));
  }
}
