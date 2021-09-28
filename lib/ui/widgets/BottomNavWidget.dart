import 'package:drawer/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

var bottomTitles = {
  'Add Sale',
  'Purchase',
  'Products',
  'Accounts',
  'Vouchers',
};

var bottomBarAssets = {
  'assets/icons/ic_sale.svg',
  'assets/icons/ic_purchase.svg',
  'assets/icons/ic_products.svg',
  'assets/icons/ic_account.svg',
  'assets/icons/ic_vouchers.svg',
};

Widget bottomNavItemView({
  int currentIndex,
  Function onClickBottomNav
}){
  return BottomNavigationBar(
    currentIndex: currentIndex,
    items: [
      for(int i = 0; i < 5; i++)
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            bottomBarAssets.elementAt(i),
            color: currentIndex == i ? cMainColor : Colors.black87,
          ),
          title: Text(
            bottomTitles.elementAt(i),
            style: TextStyle(
              fontSize: 12,
              color: currentIndex == i ? cMainColor : Colors.black
            )
          ),
        ),
    ],
    onTap: (index){
      onClickBottomNav(bottomTitles.elementAt(index), index);
    },
  );
}