import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../theme/theme.dart';

class Utility {
  static Future<bool?> myToast({required String messages}) {
    return Fluttertoast.showToast(
        msg: messages,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: MyAppColor.primaryColor,
        textColor: Colors.white,
        fontSize: 17.0);
  }
}
