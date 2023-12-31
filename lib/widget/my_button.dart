import 'package:flight_app/app_constants.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class MyButton extends StatefulWidget {
  final Function()? onPressed;
  final String  title;
  final Color color;
  final Color textColor;
  final double ?width;
  final double ?height;
  const MyButton({ 
    super.key,
    this.onPressed,  
    required this.title,
    this.color = AppConstants.primaryColor,
    this.textColor = Colors.white,
    this.width,
    this.height,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width?? fullWidth(context) * 0.9,
      height: widget.height?? fullHeight(context) * 0.06,
      child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: widget.color,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              ),
              foregroundColor: widget.textColor,
              textStyle: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: fontSize10(context) * 1.2)),
          child: Text(
            widget.title,
          )),
    );
  }
}
