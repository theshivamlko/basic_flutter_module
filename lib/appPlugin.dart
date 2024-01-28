import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

const platform = const MethodChannel('com.example.flutter_module');
String counter = '';
Future<String?> getFromNative(MethodCall methodCall) async {
  debugPrint("Future getFromNative");
  try {
    if (methodCall.method == "getFromNative") {
      String arg = methodCall.arguments;
      debugPrint("getFromNative $arg");
      Map<String, dynamic> map = jsonDecode(arg);
      counter = map['counter'];

      return counter;
    }
  } catch (e) {
    print("getFromNative $e");
  }
  return null;
}
