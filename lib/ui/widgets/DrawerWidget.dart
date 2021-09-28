import 'package:drawer/ui/widgets/OthersWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var drawerTitles = {
  'Dashboard',
  'Buy GoldPay',
  'Visit Shop',
  'Profile',
  'Change Password',
  'Balance Transfer',
  'View Investments',
  'Pin Code',
  'Withdraw Request',
  'Add Payment',
  'Chat with us',
  'Change Currency',
  'Upgrade Others',
  'Share App',
  'Logout',
};

var drawerAssets = {
  Icons.dashboard,
  Icons.attach_money,
  Icons.shopping_basket_sharp,
  Icons.person_outline,
  Icons.lock_outline,
  Icons.transfer_within_a_station,
  Icons.preview,
  Icons.push_pin_sharp,
  Icons.account_balance,
  Icons.payment,
  Icons.message,
  Icons.monetization_on,
  Icons.upgrade,
  Icons.share,
  Icons.login_outlined,
};

Widget widgetDrawer({
  BuildContext context,
  Function onClickMenu,
}){
  return Drawer(
    child: ListView(
      padding: EdgeInsets.all(0.0),
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: boldText(
            text: 'MyFy',
            sSize: 24,
            sColor: Colors.black87
          ),
          accountEmail: normalText(
            text: 'userName',
            sColor: Colors.grey,
          ),
          currentAccountPicture: Container(
            padding: EdgeInsets.all(2),
            child: Image.asset(
              'assets/icons/ic_app_splash.png',
              width: 88,
              fit: BoxFit.fitWidth,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Colors.white
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Colors.white, Colors.white
              ], // red to yellow
              tileMode: TileMode.repeated, // repeats the gradient over the canvas
            ),
          ),
        ),
        for(int i = 0; i < 12; i++) ListTile(
          title: Text(drawerTitles.elementAt(i)),
          leading: Icon(
            drawerAssets.elementAt(i),
            size: 24,
            color: Colors.black.withOpacity(0.7),
          ),
          onTap: (){
            Navigator.of(context).pop();
            onClickMenu(drawerTitles.elementAt(i), i);
          },
        ),
      ]
    ),
  );
}