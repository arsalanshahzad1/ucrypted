import 'dart:developer';
import 'package:flutter/foundation.dart';

appPrint(message) {
  debugPrint('{[🚀 PRINT] $message"}');
}

appLog(message) {
  if (kDebugMode) {
    log('{[🚀 PRINT] $message"}');
  }
}
