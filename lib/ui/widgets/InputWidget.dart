import 'package:drawer/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DropdownWidget.dart';

Widget addAccountInputText({
  var hintTxt,
  String labelText = '',
  double horPadding = 2,
  bool showOutline = false,
  TextInputType textInputType = TextInputType.text,
  TextEditingController txtController,
  double labelSize = 14,
}){
  return Container(
    margin: EdgeInsets.only(top: 8, bottom: 8),
    child: Padding(
      padding: EdgeInsets.only(left: horPadding, right: horPadding),
      child: inputTextWidget(
          controller: txtController,
          labelText: labelText,
          fontSize: 18,
          textInputType: textInputType,
          textColor: Colors.black87.withOpacity(0.7),
          showOutline: showOutline,
          hintText: hintTxt,
          labelSize: labelSize
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      color: Colors.white,
    ),
  );
}

Widget accountTypeSpinner({
  List<String> types,
  String selectedTxt,
  double horPadding,
  Function onChanged,
}){
  return Container(
    margin: EdgeInsets.only(top: 6, bottom: 6),
    child: Padding(
      padding: EdgeInsets.only(left: horPadding, right: horPadding),
      child: dropDownWidget(
          spinnerItems: types,
          selectedText: selectedTxt,
          showOutline: false,
          onChanged: (index){
            onChanged(index);
          }
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      color: Colors.white,
    ),
  );
}

Widget inputTextWidget({
  TextEditingController controller,
  TextInputType textInputType = TextInputType.text,
  double height = 52,
  bool isPass = false,
  bool enabled = true,
  bool readOnly = false,
  bool showCursor = true,
  double fontSize = 16.0,
  String hintText = '',
  String labelText = '',
  Color hintColor = Colors.grey,
  Color textColor = Colors.white,
  Color borderColor = Colors.white,
  TextAlign textAlign = TextAlign.left,
  IconData iconData,
  double rightWidgetWidth = 0,
  Widget rightWidget,
  Function onCLickIcon,
  bool showOutline = true,
  double labelSize = 14
}){
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        height: height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            if(rightWidget != null) InkWell(
              onTap: (){
                onCLickIcon();
              },
              child: rightWidget,
            ),
            SizedBox(width: 8,),
          ],
        ),
        decoration: showOutline ? BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          border: Border.all(color: borderColor, width: 1.4),
        ) : BoxDecoration(),
      ),
      Container(
        width: double.infinity,
        height: 64,
        child: Column(
          children: [
            Row(
              children: [
                if(iconData != null) SizedBox(
                  width: 32,
                  child: Icon(
                    iconData,
                    size: 26,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 6,bottom: 14, top: 0),
                    child: TextField(
                      controller: controller,
                      keyboardType: textInputType,
                      obscureText: isPass,
                      textAlign: textAlign,
                      enabled: enabled,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: fontSize,
                        color: textColor,
                      ),
                      decoration: labelText == '' ? InputDecoration(
                        hintText: hintText,
                        hintStyle: TextStyle(
                          color: hintColor,
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 6, top: 12, right: 6),
                      ) :
                      InputDecoration(
                        labelText: labelText,
                        labelStyle: TextStyle(
                          color: cMainColor,
                          fontSize: labelSize
                        ),
                        hintText: hintText,
                        hintStyle: TextStyle(
                          color: hintColor,
                          fontSize: 14
                        ),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 6, top: 12, right: 12),
                      ),
                      minLines: 1,
                      maxLines: 1,
                      readOnly: readOnly,
                      showCursor: showCursor,
                    ),
                  ),
                ),
                SizedBox(width: rightWidgetWidth,),
              ],
            ),
            Container(
              height: 1,
              color: Colors.white.withOpacity(0.84),
            ),
          ],
        ),
      ),
    ],
  );
}