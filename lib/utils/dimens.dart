import 'package:flutter/cupertino.dart';

class Dimens {

  static double screenWidth;
  static double screenHeight;
  static double screenRatio;

  static const double appBarHeight = 56;
  static double bottomBarHeight = 56;
  static double fragmentHeight = 56;

  Dimens(BuildContext context){
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    screenRatio = screenHeight / screenWidth;
    fragmentHeight = screenHeight - appBarHeight - bottomBarHeight;
  }
}