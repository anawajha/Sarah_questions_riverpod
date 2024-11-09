import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:sarahah_questions/app/localization/trans_manager.dart';
import 'package:sarahah_questions/app/utils/shared_utils.dart';
import 'package:sarahah_questions/data/enums/app_events.dart';
import 'package:sarahah_questions/data/enums/listened_channels.dart';
import 'package:sarahah_questions/data/providers/api/home_api.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';
import 'package:sarahah_questions/presentation/views/screens/app/home/home_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/app/my_wallet/my_wallet_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/app/notifications/notifications_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/app/orders/orders_screen.dart';
import 'package:sarahah_questions/presentation/views/screens/app/orders_history/orders_history_screen.dart';

class HomePlaceholderController extends MainController {
  final drawerController = AdvancedDrawerController();

  static final HomePlaceholderController to = Get.find();

  int selectedScreen = 2;
  void changeSelectedScreen(int index) {
    if (index != selectedScreen) {
    selectedScreen = index;
    update();
    }
  }

  PusherChannel? locationChannel;

  List<Widget> screens = const [
    NotificationsScreen(),
    OrdersScreen(),
    HomeScreen(),
    MyWalletScreen(),
    OrdersHistoryScreen()
  ];

  List<String> titles = [
    TransManager.notifications,
    TransManager.orders,
    TransManager.home,
    TransManager.myWallet,
    TransManager.workRecord
  ];

  void logout() async {
      showProgress();
      await HomeAPI()
          .logout();
          hideProgress();
          SharedUtils().endSession();
  }

  Future<void> getCurrentLocation() async {
    requestLocation(onGranted: () {
      Geolocator.getPositionStream(locationSettings: locationSettings)
          .listen((position) {
        if (locationChannel != null) {
          sendLocation(position);
        }
      });
    });
  }

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.bestForNavigation,
    distanceFilter: 1,
  ); 

  void sendLocation(Position pos) {
    pusher.trigger(PusherEvent(
        channelName: ListenedChannels.location.value,
        eventName: AppEvents.updateDriverLocation.value,
        userId: lss.userData?.id.toString(),
        data: jsonEncode({'id': lss.userData?.id, 'position': pos.toJson()})));
  }

  @override
  void onInit() async {
    await init();
    getCurrentLocation();
    requestLocation();
    super.onInit();
  }

  getSignature(String value) {
    var key = utf8.encode('67095fab36a562e4d761');
    var bytes = utf8.encode(value);

    var hmacSha256 = Hmac(sha256, key); // HMAC-SHA256
    var digest = hmacSha256.convert(bytes);
    return digest;
  }

  final pusher = PusherChannelsFlutter.getInstance();

Future<void> init() async {
try {
    await 
    pusher.init(
    useTLS: true,
    apiKey: "ac7fbb2759346c0dd3f1",
    cluster: "ap2",
        onEvent: onEvent,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onSubscriptionError: onSubscriptionError,
        onAuthorizer: onAuthorizer,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onDecryptionFailure: onDecryptionFailure,
  );
    locationChannel = await subscribe(ListenedChannels.location.value);
    //  await subscribe(ListenedChannels.orders.value);
    await pusher.connect();
} catch (e) {
  Logger().e("ERROR: $e");
}
}

dynamic onSubscriptionSucceeded(String channelName, dynamic data) {
  Logger().e("onSubscriptionSucceeded: $channelName data: $data");
}
  dynamic onError(String channelName, int? t, dynamic data) {
  Logger().e("onSubscriptionSucceeded: $channelName data: $data");
}

dynamic onEvent(PusherEvent event) {
  Logger().e("onEvent: $event");
}

dynamic onSubscriptionError(String message, dynamic e) {
  Logger().e("onSubscriptionError: $message Exception: $e");
}

dynamic onDecryptionFailure(String event, String reason) {
  Logger().e("onDecryptionFailure: $event reason: $reason");
}

dynamic onMemberAdded(String channelName, PusherMember member) {
  Logger().e("onMemberAdded: $channelName member: $member");
}

dynamic onMemberRemoved(String channelName, PusherMember member) {
  Logger().e("onMemberRemoved: $channelName member: $member");
}

dynamic onAuthorizer(String channelName, String socketId, dynamic options) async {
  return {
    "auth": "ac7fbb2759346c0dd3f1:${getSignature("$socketId:$channelName")}",
  };
}

void onConnectionStateChange(dynamic currentState, dynamic previousState) async {
    //   if (currentState == 'CONNECTED' && locationChannel != null) {
    //   locationChannel = await subscribe(ListenedChannels.location.value);
    // }
  Logger().e("Connection: $currentState");
}


  Future<void> updateUserLocation({
    required double? lat,
    required double? long,
  }) async {
    try {
      _setCurrentLocation(LatLng(lat ?? 0.0, long ?? 0.0));
      final data = {
        'id': lss.userData?.id,
        'position': {
          'latitude': lat,
          'longitude': long,
        },
      };
      await pusher.trigger(
        PusherEvent(
          channelName: ListenedChannels.location.value,
          eventName: 'update-location',
          data: data,
        ),
      );
    } catch (e) {
      Logger().e('updateUserLocation error: $e');
    }
  }

  LatLng? currentLocation;

  void _setCurrentLocation(LatLng location) {
    currentLocation = location;
    update();
  }
}

