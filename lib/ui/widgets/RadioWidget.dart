import 'package:drawer/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget radioHorizontal({
  int selectVal,
  List<String> values,
  double spaceDbl = 0.0,
  double fontSize = 14,
  Function onPressed
}){
  var count = values.length;
  return Row(
    children: [
      for(int i = 0; i < count; i++)
      Row(
        children: [
          InkWell(
            onTap: (){
              onPressed(i);
            },
            child: Row(
              children: [
                Radio(
                  value: i,
                  groupValue: selectVal,
                  onChanged: (value) {

                  },
                  activeColor: cMainColor,
                ),
                Text(
                  values.elementAt(i),
                  style: TextStyle(
                    fontSize: fontSize,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: spaceDbl,),
        ],
      ),
    ],
  );
}

Widget radioVertical({
  int selectVal,
  var values,
  double fontSize = 14,
  Function onPressed
}){
  var count = values.length;
  return Column(
    children: [
      for(int i = 0; i < count; i++)
        Row(
          children: [
            InkWell(
              onTap: (){
                onPressed(i);
              },
              child: Row(
                children: [
                  Radio(
                    value: i,
                    groupValue: selectVal,
                    onChanged: (value) {

                    },
                    activeColor: cMainColor,
                  ),
                  Text(
                    values.elementAt(i),
                    style: TextStyle(
                      fontSize: fontSize,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    ],
  );
}