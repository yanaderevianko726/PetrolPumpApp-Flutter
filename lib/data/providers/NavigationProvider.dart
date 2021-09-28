import 'package:flutter/material.dart';

class NavigationProvider {
  final BuildContext context;

  NavigationProvider(this.context);

  void pushToWidget({
    Widget screen,
    bool replace = false,
    Function(dynamic) pop,
  }) {

    if (replace) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<Object>(builder: (context) => screen)
      ).then((value) => {
          if (pop != null) pop(value) // ignore: sdk_version_ui_as_code
        }
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute<Object>(builder: (context) => screen)
      ).then((value) => {
          if (pop != null) pop(value)// ignore: sdk_version_ui_as_code
        }
      );
    }
  }
}
