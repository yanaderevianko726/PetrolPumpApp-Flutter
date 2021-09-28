import 'package:drawer/utils/colors.dart';
import 'package:flutter/material.dart';

import 'OthersWidget.dart';

class WidgetBtn extends FlatButton {
  WidgetBtn({
    Key key,
    String title,
    double width = double.maxFinite,
    double height = 44,
    double buttonRadius = 8.0,
    Color color = cYellow,
    Color textColor = Colors.white,
    EdgeInsets margin = EdgeInsets.zero,
    Function() onClickBtn,
  // ignore: deprecated_member_use
  }) : super(
      key: key,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        alignment: Alignment.center,
        child: boldText(
          text: title,
          sSize: 18,
          sColor: textColor,
          weight: FontWeight.w600
        ),
      ),
      onPressed: onClickBtn,
      color: color,
      disabledColor: color,
      textColor: textColor,
      disabledTextColor: textColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(buttonRadius),
      ),
    );
}
