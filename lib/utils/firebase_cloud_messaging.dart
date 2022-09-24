import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:rewards_app/shared_widgets/custom_top_toast.dart';
import 'package:rewards_app/utils/logger.dart';

class FirebaseCloudMessaging {
  late final FirebaseMessaging _messaging;

  void registerNotification() async {
    // 1. Initialize the Firebase app
    await Firebase.initializeApp();

    // 2. Instantiate Firebase Messaging
    _messaging = FirebaseMessaging.instance;

    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // Parse the message received
        print("aya eshe");
        // PushNotification notification = PushNotification(
        //   title: message.notification?.title,
        //   body: message.notification?.body,
        // );

        // setState(() {
        //   _notificationInfo = notification;
        //   _totalNotifications++;
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  dynamic initConfigure() async {
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // await flutterLocalNotificationsPlugin
    //     .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
    //     ?.createNotificationChannel(channel);

    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      // TODO: handle the received notifications

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // // Parse the message received
        // PushNotification notification = PushNotification(
        //   title: message.notification?.title,
        //   body: message.notification?.body,
        // );
        print("aya eshe");
      });
    } else {
      print('User declined or has not accepted permission');
    }

    // if (Platform.isIOS) {
    //   _fcm.requestPermission(sound: true, badge: true, alert: true);
    // }

    // _fcm.setAutoInitEnabled(true);

    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   if (notification != null) {
    //     return NotificationManager.handleNotificationMsg({message.notification!.title: message.notification!.body});
    //   }
    // });

    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   RemoteNotification? notification = message.notification;
    //   if (notification != null) {
    //     return NotificationManager.handleNotificationMsg(message.data as Map<String?, String?>);
    //   }
    // });

    // _fcm.getToken().then((value) async {
    //   logDebugMessage(message: 'Token: $value');

    //   // final storage = locator<EncryptedSecureStorage>();
    //   // await storage.write(key: AppConstants.pushNotificationToken, value: value);
    // });
  }
}

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

    NotificationsUtility().failureOrSuccessToast(
        message: '${message.keys.first}\n${message.values.first}',
        duration: Duration(seconds: 3),
        dismissAction: () {});
  }
}

class NotificationsUtility {
  void failureOrSuccessToast(
      {required String? message,
      String topMessage = "Notiftication",
      Duration duration = const Duration(minutes: 2),
      bool dismissOtherToasts = true,
      ToastEnum toastType = ToastEnum.Successful,
      required VoidCallback dismissAction}) {
    // TODO
  }
}