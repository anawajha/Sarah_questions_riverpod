import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:sarahah_questions/app/config/image_manager.dart';
import 'package:sarahah_questions/app/config/json_manager.dart';
import 'package:sarahah_questions/app/theme/color_manager.dart';
import 'package:sarahah_questions/app/utils/app_utils.dart';
import 'package:sarahah_questions/data/enums/app_events.dart';
import 'package:sarahah_questions/data/enums/listened_channels.dart';
import 'package:sarahah_questions/app/services/navigation/polyline_points_plus.dart';
import 'package:sarahah_questions/data/models/enum/order_status.dart';
import 'package:sarahah_questions/data/providers/api/home_api.dart';
import 'package:sarahah_questions/domain/entities/order.dart';
import 'package:sarahah_questions/presentation/controllers/home/home_placeholder_controller.dart';
import 'package:sarahah_questions/presentation/controllers/main_controller.dart';

class HomeController extends MainController {
  static final HomeController to = Get.find();

  PusherChannel? orderChannel;
  Order? currentTrip;
  Set<Marker> markers = {};
  Set<Circle> circles = {};
  Set<Polyline> polylines = {};

  void setCurrentTip(Order trip) async {
    HomePlaceholderController.to.changeSelectedScreen(2);
    currentTrip = trip;
    update();
    if (currentTrip != null) {
      _subscribeToOrder();
      markers.clear();
      markers.add(Marker(
          markerId: MarkerId((currentTrip!.userId ?? 0).toString()),
          position: LatLng(currentTrip!.startPosition!.latitude,
              currentTrip!.startPosition!.longitude),
          icon: await BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(size: Size(40, 40)),
              ImageManager().personMarker)));
      Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.bestForNavigation)
          .then((pos) async {
        final myPos = LatLng(pos.latitude, pos.longitude);
        await drawPolyLine(myPos, currentTrip!.startPosition!);
        await drawMyMarker(pos : myPos);
        update();
      });
    }
  }


  void _onTripStatusChangedEvent(event) {
    event as PusherEvent;
    Logger().e(event.eventName);
    if (event.eventName == AppEvents.startTrip.value) {
      currentTrip?.status = OrderStatus.startOrder;
    }else if(event.eventName == AppEvents.cancelOrderAfterApproved.value){
      _hideTrip();
    }
      update();
    // else if(event.eventName == AppEvents.endTrip.value){
    //   _hideTrip();
    // }
  }

  void _subscribeToOrder() async {
    orderChannel = await subscribe(
        '${ListenedChannels.orderWithId.value}${currentTrip!.id}');
    orderChannel?.onEvent = _onTripStatusChangedEvent;
  }

  GoogleMapController? mapController;

  void onMapCreated(GoogleMapController controller) async {
    final mapStyle = await rootBundle.loadString(JsonManager().mapStyle);
    mapController = controller;
    mapController?.setMapStyle(mapStyle);
    WidgetsBinding.instance.addPostFrameCallback((_)=> drawMyMarker());
    onMyLocationChanged();
    update();
  }

  Future<void> animateCamera(LatLng pos) async {
    try {
      if (mapController != null) {
       await mapController?.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: pos, zoom: 16)));        
      }
    //  await mapController?.animateCamera(
    //     CameraUpdate.newCameraPosition(CameraPosition(target: pos, zoom: 16)));
    }catch(e){
      Logger().e(e.toString());
    }
  }

  void driverArrived() async {
    if (orderChannel != null) {
       await changeTripStatus(status: OrderStatus.driverArrived);

      final myPos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      PusherChannelsFlutter.getInstance().trigger(PusherEvent(
          channelName:
              '${ListenedChannels.orderWithId.value}${currentTrip!.id}',
          eventName: AppEvents.driverArrived.value,
          userId: lss.userData?.id.toString(),
          data: jsonEncode(
              {'id': lss.userData?.id, 'position': myPos.toJson()})));
    }
  }

  Future<void> changeTripStatus({required OrderStatus status, bool isCancel = false}) async {
    final myPos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    showProgress();
    await HomeAPI()
        .updateOrderStatus(
            currentTrip?.id ?? 0,
            status,
            LatLng(myPos.latitude, myPos.longitude))
        .then((response) {
      hideProgress();
      response.fold((l) {
        AppUtils().snackError(body: l.message ?? '');
      }, (r) async {
        currentTrip = r;
        if (r.status == OrderStatus.canceled || r.status == OrderStatus.endOrder) {
          _hideTrip();          
        }
        // else if(r.status == OrderStatus.endOrder){
        //   _hideTrip();
        // }
        // if (!isCancel) {
        // await changeMarkers();          
        // }
        update();
      });
    });
  }

  Future<void> changeMarkers() async {
    if (currentTrip != null) {
    markers.clear();
    await drawPolyLine(
        currentTrip!.startPosition!, currentTrip!.destinationPosition!);
    await drawMyMarker(pos: currentTrip!.startPosition!);
    update();
    }
  }

  Future<void> drawPolyLine(LatLng origin, LatLng destination) async {
    polylines.clear();
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyBUeYrCZalaGr1rwM5kz7N90221lHEfCVM', origin, destination);
    polylines.add(Polyline(
        polylineId: PolylineId(currentTrip!.id.toString()),
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        points: result.points,
        width: 4,
        color: ColorManager().primary));
  }

  Future<void> drawMyMarker({LatLng? pos}) async {
      await requestLocation(onGranted: () async {
        if (pos == null) {
    final myPos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
          pos = LatLng(myPos.latitude, myPos.longitude);
    }
     markers.clear();
     circles.clear();
     markers.add(Marker(
            markerId: MarkerId((lss.userData?.id ?? 0).toString()),
            position: pos!,
            icon: await BitmapDescriptor.fromAssetImage(
                const ImageConfiguration(size: Size(40, 40)),
                ImageManager().locationDirection),
            anchor: const Offset(0.5, 0.5)));
        circles.add(Circle(
            circleId: CircleId((lss.userData?.id ?? 0).toString()),
            center: pos!,
            radius: 40,
            strokeWidth: 3,
            strokeColor: ColorManager().primary,
            fillColor: ColorManager().primary.withOpacity(0.2)));
            await animateCamera(pos!);
            update();
      });
    
  }

  void cancelTrip() async {
    await changeTripStatus(status: OrderStatus.canceled, isCancel: true).then((value){
      _hideTrip();
    });
  }

  void onMyLocationChanged(){
    Geolocator.getPositionStream(locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation)).listen(
    (Position position) {
      if (currentTrip != null) {
            drawMyMarker(pos: LatLng(position.latitude, position.longitude));
            if (currentTrip!.status == OrderStatus.startOrder) {
            drawPolyLine(LatLng(position.latitude, position.longitude), currentTrip!.destinationPosition!);              
            }
            if (currentTrip!.status == OrderStatus.driverApproved) {
            drawPolyLine(LatLng(position.latitude, position.longitude), currentTrip!.startPosition!);              
            }
      }
    });
  }

    Future<void> getCurrentOrder() async {
      showProgress();
      final res = await HomeAPI().getCurrentOrder();
      hideProgress();
      res.fold(
        (l) {
          AppUtils().snackError(body: l.message ?? '');
        },
        (r) {
          if (r != null) {
            setCurrentTip(r);            
          }
        },
      );
    }

    @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_)=>
    getCurrentOrder());
    super.onInit();
  }

  void _hideTrip(){
    currentTrip = null;
      polylines.clear();
      drawMyMarker();
      update();
  }

  @override
  void dispose() {
    mapController?.dispose();
    super.dispose();
  }
}
