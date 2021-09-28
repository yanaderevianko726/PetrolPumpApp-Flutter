import 'package:drawer/utils/colors.dart';
import 'package:drawer/utils/dimens.dart';
import 'package:drawer/utils/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: non_constant_identifier_names
Widget AppBarWidget({
  String title = '',
  double height = Dimens.appBarHeight,
  Color backgroundColor = cMainColor,
  Brightness brightness = Brightness.dark,
  bool topRightEn = false,
  IconData actionIconData,
  Function onTapBack,
  Function addEvent,
}){
  return AppBar(
    title: Text(title),
    toolbarHeight: height,
    backgroundColor: backgroundColor,
    brightness: brightness,
    elevation: 8,
    actions: <Widget>[
      topRightEn ? Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {
            addEvent();
          },
          child: Icon(
            Icons.add,
            size: 26.0,
          ),
        )
      ) : Container(),
    ],
  );
}

Widget mainLogoWidget({
  double dWidth = 280,
  bool showDomain = true
}){
  return Image.asset(
    'assets/goldpay/logo_transparent.png',
    width: dWidth,
    fit: BoxFit.fitWidth,
  );
}

Widget normalText({
  String text,
  double sSize = 14.0,
  bool isItalic = false,
  Color sColor = Colors.grey,
  TextAlign txtAlign = TextAlign.center,
}){
  return Text(
    text,
    style: TextStyle(
      color: sColor,
      fontSize: sSize,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal
    ),
    textAlign: txtAlign
  );
}

Widget boldText({
  String text,
  double sSize = 20.0,
  Color sColor = Colors.black87,
  bool isItalic = false,
  TextAlign txtAlign = TextAlign.center,
  FontWeight weight = FontWeight.w500,
  int maxLine = 1
}){
  return Text(
    text,
    textAlign: txtAlign,
    style: TextStyle(
      color: sColor,
      fontSize: sSize,
      fontWeight: weight,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal
    ),
    maxLines: maxLine,
  );
}

Widget horizLine(){
  return Expanded(
    child: Container(
      height: 1.0,
      color: Colors.grey,
    ),
  );
}

Widget verticalLine({
  double width = 2.0,
  Color color = Colors.grey,
}){
  return Expanded(
    child: Container(
      width: width,
      color: Colors.grey,
    ),
  );
}

// ignore: non_constant_identifier_names
Widget emptyAppBarWidget({
  String title = '',
  Color backgroundColor = cMainColor,
  Brightness brightness = Brightness.dark,
}){
  return AppBar(
    title: Text(title),
    toolbarHeight: 0,
    backgroundColor: backgroundColor,
    brightness: brightness,
  );
}

// ignore: missing_return
LinearGradient mainGradientWidget({
  List<Color> colors = const <Color>[
    Color(0xff061956), Color(0xff9268fc)
  ],
}){
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: colors,
    tileMode: TileMode.repeated,
  );
}

InputDecoration textFieldDecoration({
  String labelText = '',
  String hintText,
  Widget suffixIcon,
  Color hintColor,
  EdgeInsets padding,
  bool enableUnderLine,
}){
  return InputDecoration(
    hintText: hintText,
    contentPadding: padding,
    focusedBorder: enableUnderLine ? OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ) : InputBorder.none,
    enabledBorder: enableUnderLine ? OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ) : InputBorder.none,
    errorBorder: InputBorder.none,
    suffix: suffixIcon,
    hintStyle: TextStyle(
      color: hintColor
    ),
    labelText: labelText
  );
}

