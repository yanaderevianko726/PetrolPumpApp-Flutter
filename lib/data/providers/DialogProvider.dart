import 'package:drawer/ui/widgets/InputWidget.dart';
import 'package:drawer/ui/widgets/OthersWidget.dart';
import 'package:drawer/utils/colors.dart';
import 'package:drawer/utils/constants.dart';
import 'package:drawer/utils/dimens.dart';
import 'package:flutter/material.dart';

class DialogProvider {
  final BuildContext context;
  DialogProvider(this.context);

  Widget dateFilterWidget({
    TextEditingController startCtrl,
    TextEditingController endCtrl,
    Function onCancel,
    Function onFilter,
  }){
    return Center(
      child: Container(
        width: Dimens.screenWidth * 0.87,
        height: 300,
        child: Column(
          children: [
            Container(
              height: 64,
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  boldText(
                    text: 'Filter by Date',
                    sSize: 22,
                    sColor: Colors.white
                  ),
                  Spacer(),
                  Icon(
                    Icons.date_range,
                    color: Colors.white,
                    size: 26,
                  )
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24)
                ),
                color: cMainColor
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
              child: Column(
                children: [
                  addAccountInputText(
                    txtController: startCtrl,
                    hintTxt: '12/09/2021',
                    labelText: 'Start Date',
                    showOutline: true
                  ),
                  addAccountInputText(
                    txtController: endCtrl,
                    hintTxt: '12/09/2021',
                    labelText: 'End Date',
                    showOutline: true
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 6, bottom: 6),
                    child: Row(
                      children: [
                        Spacer(),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                            onFilter();
                          },
                          child: boldText(
                            text: 'CANCEL',
                            sSize: 16,
                            sColor: Colors.grey,
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).pop();
                            onCancel();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(left: 38, right: 22),
                            child: boldText(
                              text: 'FILTER',
                              sSize: 16,
                              sColor: cMainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 3.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showCustomDialog({
    Widget contentWidget,
  }) async {
    return await showDialog<dynamic>(
      context: context,
      builder: (context) => GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: contentWidget,
        ),
      ),
    );
  }
}

showAlertDialog({
  BuildContext context,
  String alertTitle,
  String okTitle,
  Function() onCancel,
  Function() onSave
}) {
  Widget cancelButton = FlatButton(
    child: Text(
      'Cancel',
      style: TextStyle(
        fontSize: 16,
        color: Colors.red
      ),
    ),
    onPressed:  () {
      Navigator.of(context, rootNavigator: true).pop();
      onCancel();
    },
  );

  Widget okButton = FlatButton(
    child: Text(
      okTitle,
      style: TextStyle(
        fontSize: 16,
        color: Colors.black87
      ),
    ),
    onPressed:  () {
      Navigator.of(context, rootNavigator: true).pop();
      onSave();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Row(
      children: [
        Image.asset(
          'assets/images/ic_app_icon.png',
          width: 32, height: 32,
        ),
        SizedBox(width: 6,),
        Text(
          appName,
          style: TextStyle(
            fontSize: 18,
            color: cMainColor
          ),
        ),
      ],
    ),
    content: Text(alertTitle),
    actions: [
      cancelButton,
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
