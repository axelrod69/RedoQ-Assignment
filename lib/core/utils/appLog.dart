import 'dart:developer';
import 'package:flutter/foundation.dart';

class AppLog {
  static void showLog(
      {String? tag, String? message, Object? object, StackTrace? stackTrace}) {
    {
      if (kDebugMode) {
        log('Tag: $tag,\n Message: $message, \n Object $object, \n StackTrace: $stackTrace');
      }
    }
  }
}
