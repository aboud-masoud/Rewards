import 'package:flutter/material.dart';
import 'package:rewards_app/app.dart';
import 'package:rewards_app/utils/logger.dart';

class NotificationManager {
  static DateTime f = DateTime.now();

  static BuildContext? context;
  static dynamic init({required BuildContext context}) {
    context = context;
  }

  //this method used when notification come and app is closed or in background and
  // user click on it, i will left it empty for you
  static dynamic handleDataMsg(Map<String, dynamic> data) {}

  //this our method called when notification come and app is foreground
  static dynamic handleNotificationMsg(Map<String?, String?> message) {
    logDebugMessage(message: "from mangger  $message");

    ScaffoldMessenger.of(appKey.currentContext!).showSnackBar(SnackBar(
      content: Text('${message.keys.first}\n${message.values.first}'),
    ));
  }
}
