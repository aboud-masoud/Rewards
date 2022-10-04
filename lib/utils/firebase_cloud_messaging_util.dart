import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:rewards_app/utils/notification_manager.dart';

class FirebaseCloudMessagingUtil {
  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  static dynamic initConfigure(BuildContext context) async {
    await _fcm.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    //  _iosPermission();
    if (Platform.isIOS) {
      _fcm.requestPermission(sound: true, badge: true, alert: true);
    }
    // _fcm.requestNotificationPermissions();
    _fcm.setAutoInitEnabled(true);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        return NotificationManager.handleNotificationMsg({message.notification!.title: message.notification!.body});
      }
    });

    FirebaseMessaging.onBackgroundMessage((message) async {
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        print("sss");
        //   return NotificationManager.handleNotificationMsg({message.notification!.title: message.notification!.body});
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        return NotificationManager.handleNotificationMsg(message.data as Map<String?, String?>);
      }
    });

    _fcm.getToken().then((value) async {
      log('Token: $value');
    });
  }
}
