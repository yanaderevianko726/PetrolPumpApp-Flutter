import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget dropDownWidget({
  List<String> spinnerItems,
  String selectedText,
  Function onChanged,
  double width = 56,
  double height = 56,
  Color dropDownColor = Colors.black,
  Color spinTextColor = Colors.white,
  Color iconColor = Colors.black,
  Color backColor = Colors.transparent,
  Color borderColor = Colors.grey,
  bool isExpanded = true,
  double fontSize = 16,
  int maxLine = 1,
  bool showOutline = true,
}){
  return Container(
    width: width,
    height: height,
    padding: EdgeInsets.only(top: 6, bottom: 6),
    child: DropdownButton<String>(
      value: selectedText,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      iconEnabledColor: iconColor,
      isExpanded: isExpanded,
      underline: Container(
        height: 1.0,
        color: Colors.transparent,
      ),
      onChanged: (String data) {
        var index = 0;
        for(var i=0; i<spinnerItems.length; i++){
          if(data == spinnerItems.elementAt(i)){
            index = i;
          }
        }
        onChanged(index);
      },
      items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(
              color: selectedText == value ? Colors.white : spinTextColor,
              fontSize: fontSize,
            ),
            maxLines: maxLine,
          )
        );
      }).toList(),
      dropdownColor: dropDownColor
    ),
    decoration: showOutline ? BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      border: Border.all(color: borderColor, width: 1.2),
      color: backColor,
    ) : BoxDecoration(),
  );
}