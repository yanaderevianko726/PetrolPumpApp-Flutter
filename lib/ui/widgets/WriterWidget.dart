import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget writerWidget({
  TextEditingController controller,
  double fontSize = 14.0,
  String hintText = '',
  Color hintColor = Colors.grey,
  Color textColor = Colors.black87,
  TextAlign textAlign = TextAlign.left,
  TextInputType textInputType = TextInputType.text,
}){
  return Container(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          color: textColor
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
              color: hintColor
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 6, top: 12, right: 12),
        ),
        minLines: 4,
        maxLines: 8,
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      border: Border.all(color: Colors.grey, width: 1),
    ),
  );
}