import 'dart:async';
import 'dart:convert';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:sarahah_questions/app/utils/app_utils.dart';
import 'package:sarahah_questions/data/enums/app_events.dart';
import 'package:sarahah_questions/data/enums/listened_channels.dart';
import 'package:sarahah_questions/data/providers/api/order_api.dart';
import 'package:sarahah_questions/domain/entities/order.dart';
import 'package:sarahah_questions/presentation/controllers/home/home_controller.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class OrdersController extends MainController {

  static final OrdersController to = Get.find();
  PusherChannel? ordersChannel;

  List<Order> orders = [];

  FutureOr<bool> onSwipe(int a, int? c, CardSwiperDirection csd) async {
    orders.removeAt(a);
    update();
    Logger().e("$a $c $csd");
    return true;
  }
  
  Future<void> getOrders() async {
      startLoading();
      final res = await OrderAPI()
          .getMyOrders();
      res.fold(
        (l) {
          AppUtils().snackError(body: l.message ?? '');
        },
        (r) {
          orders = r;
        },
      );
      stopLoading();
    }

  Future<void> acceptOrder(int? orderId) async {
      showProgress();
        final myPos = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.bestForNavigation);
      final res = await OrderAPI()
          .acceptOrder(orderId: orderId, latLng: LatLng(myPos.latitude, myPos.longitude));
      res.fold(
        (l) {
          AppUtils().snackError(body: l.message ?? '');
        },
        (r) {
          orders.removeWhere((element) => element.id == r.id);
          update();
          HomeController.to.setCurrentTip(r);
        },
      );
      hideProgress();
    }

    @override
  void onInit() async {
    getOrders();
    // if (ordersChannel != null) {
    ordersChannel = await subscribe(ListenedChannels.orders.value);
    ordersChannel?.onEvent = onOrdersEvent;
    // }
    super.onInit();
  }

  // prepareOrdersEvents (){}

  void onOrdersEvent(event){
    event as PusherEvent;
    Logger().e(event.eventName);
    if (event.eventName == AppEvents.availableOrder.value) {
      final data = jsonDecode(event.data);
      orders.add(Order.fromJson(data["orders"]));
      update();
    }else if(event.eventName == AppEvents.cancelOrder.value){
      final data = jsonDecode(event.data);
      final canceledOrder = Order.fromJson(data["order"]);
      orders.removeWhere((o)=> o.id == canceledOrder.id);
      update();
    }
  }
}