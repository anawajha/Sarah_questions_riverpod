import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:sarahah_questions/app/services/storage/local_storage.dart';
import 'package:sarahah_questions/app/utils/my_get_utils.dart';
import 'package:sarahah_questions/presentation/views/widgets/progress_dialog.dart';

class MainController extends GetxController {
  final LocalStorageService lss = MyGetUtils().findService(LocalStorageService());
  bool isLoading = false;
  bool progressLoading = false;

  void startLoading() {
    isLoading = true;
    update();
  }

  void stopLoading() {
    isLoading = false;
    update();
  }

  void showProgress() {
    progressLoading = true;
    Get.dialog(
      const ProgressDialog(),
      barrierDismissible: false
    );
    update();
  }

  void hideProgress() {
    progressLoading = false;
    Get.close(1);
    update();
  }


Future<void> requestLocation({dynamic Function()? onGranted}) async {
  await Geolocator.checkPermission().then((value) async {
    if (value == LocationPermission.whileInUse ||
        value == LocationPermission.always) {
      if (await Geolocator.isLocationServiceEnabled()) {
        onGranted?.call();
      } else {
        if (await Geolocator.openLocationSettings()) {
           requestLocation(onGranted: onGranted);
        } else {
          return;
        }
      }
    } else {
      LocationPermission locationPermission =
          await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.whileInUse ||
          locationPermission == LocationPermission.always) {
          requestLocation(onGranted: onGranted);
      } else {
        return;
      }
    }
  });
}

 Future<PusherChannel> subscribe(String channelName) async {
    return await PusherChannelsFlutter.getInstance().subscribe(
        channelName: channelName);
  }

  // @override
  // void dispose() {
  //   // pusher.disconnect();
  //   super.dispose();
  // }
}
