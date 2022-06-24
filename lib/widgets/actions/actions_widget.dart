import 'package:crypto_app_flutter/pages/deposit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:unicons/unicons.dart';
import 'action_widget.dart';

Padding actionsWidget(ThemeData themeData, BuildContext context) {

  return Padding(
    padding: EdgeInsets.symmetric(vertical: 2.5.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.grey
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Deposit()));
          },
          child: actionWidget(UniconsLine.download_alt, 'Deposit', themeData),
        ),
        SizedBox(width: 10,),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Deposit()));
          },
          child: actionWidget(UniconsLine.upload_alt, 'Withdraw', themeData),
        ),
        ],
    ),
  );
}