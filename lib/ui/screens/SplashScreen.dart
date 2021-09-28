import 'package:drawer/data/providers/NavigationProvider.dart';
import 'package:drawer/ui/widgets/ButtonWidget.dart';
import 'package:drawer/ui/widgets/OthersWidget.dart';
import 'package:drawer/utils/colors.dart';
import 'package:drawer/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'MainScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key, }) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    initAppData();
  }

  initAppData() async {
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Dimens(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: splashWidget(
        onClickContinue: (){

        }
      ),
    );
  }

  gotoNext() {
    NavigationProvider(context).pushToWidget(
      screen: MainScreen(),
      replace: true
    );
  }
}

Widget splashWidget({
  Function onClickContinue
}){
  return Stack(
    children: [
      Container(
        width: Dimens.screenWidth,
        height: Dimens.screenHeight,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 220),
              child: boldText(
                text: 'Welcome to MyFy',
                sColor: cMainColor,
                sSize: 26,
                maxLine: 2
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.only(bottom: 72),
              child: WidgetBtn(
                title: 'Continue',
                textColor: Colors.white,
                width: Dimens.screenWidth * 0.8,
                height: 50,
                color: cYellow,
                onClickBtn: (){
                  onClickContinue();
                },
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

