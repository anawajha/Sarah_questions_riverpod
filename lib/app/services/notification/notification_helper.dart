import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:sarahah_questions/app/services/images/images_utils.dart';

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

     final imagePath = notificationData['avatar'];

     final senderAvatarPath = await ImagesUtils().download(imagePath);

     final largeIcon = ByteArrayAndroidBitmap.fromBase64String(
         ImagesUtils().getBase64FormateFile(senderAvatarPath ?? ''));

     final senderAvatar = ByteArrayAndroidIcon.fromBase64String(
         ImagesUtils().getBase64FormateFile(senderAvatarPath ?? ''));

     Logger().e(senderAvatar);
     flutterLocalNotificationsPlugin.show(
       Random().nextInt(100),
       notificationData['title'],
       notificationData['body'],
       NotificationDetails(
         android: AndroidNotificationDetails(
           getNotificationChannel().id,
           getNotificationChannel().name,
           styleInformation: MessagingStyleInformation(
             Person(
               name: notificationData['title'],
               icon: senderAvatar,
             ),
             messages: [
               Message(
                 notificationData['body'],
                 message.sentTime!,
                 null,
               ),
             ],
           ),
           enableLights: true,
           fullScreenIntent: true,
           importance: Importance.max,
           priority: Priority.max,
           largeIcon: largeIcon,
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

     final imagePath = notificationData['avatar'];

     final senderAvatarPath = await ImagesUtils().download(imagePath);

     final bigPicture = ByteArrayAndroidBitmap.fromBase64String(
       ImagesUtils().getBase64FormateFile(senderAvatarPath ?? ''),
     );

     final bigPictureStyleInformation = BigPictureStyleInformation(
       bigPicture,
       contentTitle: notificationData['title'],
       htmlFormatContentTitle: true,
       summaryText: notificationData['title'],
       htmlFormatSummaryText: true,
     );

     flutterLocalNotificationsPlugin.show(
       Random().nextInt(100),
       notificationData['title'],
       notificationData['body'],
       NotificationDetails(
         android: AndroidNotificationDetails(
           getNotificationChannel().id,
           getNotificationChannel().name,
           styleInformation: bigPictureStyleInformation,
           enableLights: true,
           importance: Importance.max,
           priority: Priority.max,
           largeIcon: bigPicture,
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

     final imagePath = message.data['image'];
     String? senderAvatarPath;

     if (imagePath != null) {
       senderAvatarPath = await ImagesUtils().download(imagePath);
     }

     final largeIcon = ByteArrayAndroidBitmap.fromBase64String(
         ImagesUtils().getBase64FormateFile(senderAvatarPath ?? ''));

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
           largeIcon: largeIcon,
           styleInformation: const DefaultStyleInformation(true, true),
         ),
         iOS: DarwinNotificationDetails(
             presentAlert: true,
             presentBadge: true,
             presentSound: true,
             attachments: [
               DarwinNotificationAttachment(senderAvatarPath ?? '')
             ]),
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
