import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';
import 'package:sarahah_questions/app/extensions/string.dart';
import 'package:sarahah_questions/data/models/enum/order_status.dart';

class Order {
  int? id;
  int? userId;
  LatLng? startPosition;
  LatLng? destinationPosition;
  String? address;
  String? targetAddress;
  String? riderName;
  String? riderAvatar;
  String? riderPhone;
  bool? accepted;
  OrderStatus? status;
  num? price;
  DateTime? createdAt;
  DateTime? updateAt;

    Order({
       required this.id,
       required this.userId,
       required this.startPosition,
       required this.destinationPosition,
       required this.address,
       required this.targetAddress,
       required this.accepted,
       required this.status,
       required this.createdAt,
       required this.updateAt,
       required this.riderName,
       required this.riderAvatar,
       required this.riderPhone,
       required this.price
    });


    factory Order.fromJson(Map<String, dynamic> json) {
        Logger().e(json);
      return Order(
        id: json["id"],
        userId: json["user_id"],
        startPosition: (json["lat_start"] != null && json["long_start"] != null ) ? LatLng(json["lat_start"], json["long_start"]) : null,
        destinationPosition: (json["lat_end"] != null && json["long_end"] != null) ? LatLng(json["lat_end"], json["long_end"]) : null,
        address: json["user_address"],
        targetAddress: json ["target_address"],
        accepted: json["is_accepted"],
        riderName: json["user_name"],
        riderAvatar: json["user_image"],
        riderPhone: json["user_phone"],
        status: OrderStatus.values.where((e) => e.name == json["status"]).first,
        price: json["price"],
        createdAt: json["created_at"].toString().getDateTimeFromLaravelTimestamp(),
        updateAt: json["updated_at"].toString().getDateTimeFromLaravelTimestamp(),
    );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "model": userId,
        "lat_start": startPosition?.latitude,
        "long_start": startPosition?.longitude,
        "lat_end": startPosition?.latitude,
        "long_end": startPosition?.longitude,
        'user_address' : address,
        'target_address' : targetAddress,
        'is_accepted' : accepted,
        'user_name' : riderName,
        'user_image' : riderAvatar,
        'user_phone' : riderPhone,
        'status' : status?.name,
        'price' : price,
        'created_at' : createdAt,
        'updated_at' : updateAt
    };

    bool get canStartTrip => status?.name == OrderStatus.driverArrived.name;
    bool get canFinishTrip => status?.name == OrderStatus.startOrder.name;
}
