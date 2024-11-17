import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';

class NotificationHelper {
  factory NotificationHelper() => _instance;
  NotificationHelper._internal();
  static final NotificationHelper _instance = NotificationHelper._internal();

  static Future<void> handleNotification(Map<String, dynamic> message) async {}

  Future<void> showNotificationWithImage({
    required RemoteMessage message,
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  }) async {
    final Map<String, dynamic> notificationData = message.data;

    flutterLocalNotificationsPlugin.show(
      Random().nextInt(100),
      notificationData['title'],
      notificationData['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          getNotificationChannel().id,
          getNotificationChannel().name,
          enableLights: true,
          fullScreenIntent: true,
          importance: Importance.max,
          priority: Priority.max,
        ),
      ),
      payload: jsonEncode(notificationData),
    );
  }

  AndroidNotificationChannel getNotificationChannel() {
    return const AndroidNotificationChannel(
      'bulbul',
      'bulbul',
      importance: Importance.max,
    );
  }

  Future<void> showBigPictureStyleInformation({
    required RemoteMessage message,
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  }) async {
    final Map<String, dynamic> notificationData = message.data;

    flutterLocalNotificationsPlugin.show(
      Random().nextInt(100),
      notificationData['title'],
      notificationData['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          getNotificationChannel().id,
          getNotificationChannel().name,
          enableLights: true,
          importance: Importance.max,
          priority: Priority.max,
        ),
      ),
      payload: jsonEncode(notificationData),
    );
  }

  Future<void> showDefaultNotification({
    required RemoteMessage message,
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  }) async {
    if (Platform.isIOS) {
      return;
    }


    flutterLocalNotificationsPlugin.show(
      Random().nextInt(100),
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      NotificationDetails(
        android: AndroidNotificationDetails(
          getNotificationChannel().id,
          getNotificationChannel().name,
          enableLights: true,
          importance: Importance.max,
          priority: Priority.max,
          onlyAlertOnce: true,
          styleInformation: const DefaultStyleInformation(true, true),
        ),
        iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
            ),
      ),
      payload: jsonEncode(message.data),
    );
  }

  Future<void> showSimpleNotification({
    required RemoteMessage message,
    required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
  }) async {
    if (Platform.isIOS) {
      return;
    }

    flutterLocalNotificationsPlugin.show(
      Random().nextInt(100),
      message.notification?.title ?? '',
      message.notification?.body ?? '',
      NotificationDetails(
        android: AndroidNotificationDetails(
          getNotificationChannel().id,
          getNotificationChannel().name,
          enableLights: true,
          importance: Importance.max,
          priority: Priority.max,
          onlyAlertOnce: true,
          styleInformation: const DefaultStyleInformation(true, true),
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: jsonEncode(message.data),
    );
  }

  //dismiss notification
  Future<void> dismissNotification(
      {required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      required int id}) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  //dismiss all notification
  Future<void> dismissAllNotification(
      {required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      required int id}) async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  //get all notification
  Future<List<PendingNotificationRequest>> getAllNotification(
      {required FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin,
      required int id}) async {
    return await flutterLocalNotificationsPlugin.pendingNotificationRequests();
  }

  //request permission
  Future<void> requestPermission(
      {required FirebaseMessaging firebaseMessaging}) async {
    await firebaseMessaging.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );
  }

  void goToSpecificPage(Map<String, dynamic> data) {
    try {} catch (e) {
      Logger().e(e);
    }
  }

  Future<void> updateFromNotification(Map<String, dynamic> data) async {
    try {} catch (e) {
      Logger().e(e);
    }
  }
}
