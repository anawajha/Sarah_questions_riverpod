import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sarahah_questions/presentation/views/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/services/storage/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  await Firebase.initializeApp();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // NotificationManager.instance.init();

  runApp(ProviderScope(child: const AppWidget()));
}

initServices() async {
  await Get.putAsync(() async => await LocalStorageService().init());
}
