import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:logger/logger.dart';
import 'package:sarahah_questions/app/services/notification/notification_helper.dart';
import 'package:sarahah_questions/app/services/storage/local_storage.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';

class NotificationManager {
  static NotificationManager instance = NotificationManager._();

  NotificationManager._() {
     _firebaseMessaging = FirebaseMessaging.instance;
     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
   }

   RemoteMessage messages = const RemoteMessage();

   late final FirebaseMessaging _firebaseMessaging;
   late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
   static NotificationManager fcmInstance = NotificationManager._();

   Future<void> init() async {
     try {
       await configuration();
       await registerNotification();
       await getTokenFCM();
     } catch (e) {
       Logger().e('msg_fcm_error: $e');
     }
   }

   Future<void> configuration() async {
     const AndroidInitializationSettings initializationSettingsAndroid =
         AndroidInitializationSettings('drawable/ic_launcher_monochrome');

     const initializationSettingsIOS = DarwinInitializationSettings();

     const InitializationSettings initializationSettings =
         InitializationSettings(
       android: initializationSettingsAndroid,
       iOS: initializationSettingsIOS,
     );

     await flutterLocalNotificationsPlugin.initialize(
       initializationSettings,
       );
     await flutterLocalNotificationsPlugin.initialize(
       initializationSettings,
       onDidReceiveNotificationResponse: (details) {
         Logger().i('onDidReceiveNotificationResponse');
         NotificationHelper().goToSpecificPage(
           jsonDecode(details.payload ?? ''),
         );
       },
     );
     final notificationAppLaunchDetails =
         await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
     if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
       NotificationHelper().goToSpecificPage(
         jsonDecode(
             notificationAppLaunchDetails?.notificationResponse?.payload ?? ''),
       );
     }
   }

   Future<void> registerNotification() async {
     await _firebaseMessaging.requestPermission(
       announcement: true,
       carPlay: true,
       criticalAlert: true,
       provisional: true,
     );
     await _firebaseMessaging.setForegroundNotificationPresentationOptions(
       alert: true,
       badge: true,
       sound: true,
     );

     FirebaseMessaging.onMessage.listen((message) {
       Logger().e('onMessage_Map: ${message.toMap()}');
       Logger().e('onMessage_Data: ${message.data}');
       messages = message;
       NotificationHelper().updateFromNotification(message.data);
       if (GetUtils.isURL(messages.data['image'] ?? '')) {
         NotificationHelper().showDefaultNotification(
           message: message,
           flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
         );
       } else {
         NotificationHelper().showSimpleNotification(
           message: message,
           flutterLocalNotificationsPlugin: flutterLocalNotificationsPlugin,
         );
       }
     });
   }

   Future<void> getTokenFCM() async {
     final token = await _firebaseMessaging.getToken();
     final localService = MyGetUtils().findService(LocalStorageService());
     Logger().e('fcm_token: $token');
     localService.fcmToken = token;
      }
 }

