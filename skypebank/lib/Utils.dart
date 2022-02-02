import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppColors {

  static const Color mainColor = Color(0xFFeeee22);
  static const Color mainColorDark = Color(0xFFB6B61C);
  static const mainColorLightColor = Color(0xFFEDEDC6);
  static const Color drakblue = Color(0xFF516261);

  static const Color yellow = Color(0xFFFEAA34);

  static const Color light_grey = Color(0xFFDEDEDE);
  static const Color textColor = Color(0xFF323F4B);
  static const Color green = Color(0xFF006400);
  static const Color white = Color(0xFFffffff);
  static const Color neutural_gray = Color(0xff5a5757);
  static const Color textColorlightblack = Color(0xee1f1e1e);
  static const Color black = Color(0xff000000);
  static const Color bgColor = Color(0xffeeeef4);


  static const Color logo_circle_one = Color(0xFF787676);
  static const Color logo_circle_two = Color(0xFF62FFB8);
  static const Color button_one = Color(0xFF3FE093);
  static const Color button_two = Color(0xFF4169E1);
  static const Color red = Color(0xFFF51738);

  static const Map<int, Color> colorConvert =
  {
    50:Color.fromRGBO(4,131,184, .1),
    100:Color.fromRGBO(4,131,184, .2),
    200:Color.fromRGBO(4,131,184, .3),
    300:Color.fromRGBO(4,131,184, .4),
    400:Color.fromRGBO(4,131,184, .5),
    500:Color.fromRGBO(4,131,184, .6),
    600:Color.fromRGBO(4,131,184, .7),
    700:Color.fromRGBO(4,131,184, .8),
    800:Color.fromRGBO(4,131,184, .9),
    900:Color.fromRGBO(4,131,184, 1),
  };

  static errorToast(String msg){
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static successToast(String msg){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
    );
  }
}
Widget getImageLoader(){
  return
    Center(
      child: Image.asset(
        "assets/images/Loader.gif",
        height: 60,width: 60,
      ),
    );
}
Widget Loader() {
  return Center(
    child: SpinKitWave(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: index.isEven ? AppColors.mainColor : AppColors.mainColorLightColor,
          ),
        );
      },
      size: 30.0,
    ),
  );
}

