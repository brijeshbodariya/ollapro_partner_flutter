import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ollapro_partner/common/app.dart';

class Utils{
  static double getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
  void switchFocus(BuildContext context, FocusNode current, FocusNode next) {
    if (current.hasFocus) {
      current.unfocus();
      FocusScope.of(context).requestFocus(next);
    }
  }
  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: white,
        textColor: primaryColor);
  }
}