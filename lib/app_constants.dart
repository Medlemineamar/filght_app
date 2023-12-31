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

}
