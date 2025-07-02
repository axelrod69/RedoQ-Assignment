import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> showSuccessToast({String? message}) async {
  await Fluttertoast.showToast(
      msg: message ?? '',
      backgroundColor: Colors.black,
      toastLength: Toast.LENGTH_LONG,
      textColor: Colors.white);
}
