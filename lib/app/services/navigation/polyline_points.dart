
// import 'dart:convert';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:sarahah_questions/data/core/dio_manger.dart';


// class PolylinePoints {
//   final util = _NetworkUtil();
//   Future<PolylineResult> getRouteBetweenCoordinates(
//       String googleApiKey, LatLng origin, LatLng destination,
//       {TravelMode travelMode = TravelMode.driving,
//       List<PolylineWayPoint> wayPoints = const [],
//       bool avoidHighways = false,
//       bool avoidTolls = false,
//       bool avoidFerries = true,
//       bool optimizeWaypoints = false}) async {
//     return await util.getRouteBetweenCoordinates(
//         googleApiKey,
//         origin,
//         destination,
//         travelMode,
//         wayPoints,
//         avoidHighways,
//         avoidTolls,
//         avoidFerries,
//         optimizeWaypoints);
//   }

//   List<LatLng> decodePolyline(String encodedString) {
//     return util.decodeEncodedPolyline(encodedString);
//   }
// }


// class PolylineResult {
//   String? status;
//   List<LatLng> points;
//   String? errorMessage;

//   PolylineResult({this.status, this.points = const [], this.errorMessage = ""});
// }


// class PolylineWayPoint {
//   String location;
//   bool stopOver;

//   PolylineWayPoint({required this.location, this.stopOver = true});

//   @override
//   String toString() {
//     if (stopOver) {
//       return location;
//     } else {
//       return "via:$location";
//     }
//   }
// }

// enum TravelMode { driving, bicycling, transit, walking }

// class _NetworkUtil {
//   static const String statusOk = "ok";

//   Future<PolylineResult> getRouteBetweenCoordinates(
//       String googleApiKey,
//       LatLng origin,
//       LatLng destination,
//       TravelMode travelMode,
//       List<PolylineWayPoint> wayPoints,
//       bool avoidHighways,
//       bool avoidTolls,
//       bool avoidFerries,
//       bool optimizeWaypoints) async {
//     String mode = travelMode.toString().replaceAll('TravelMode.', '');
//     PolylineResult result = PolylineResult();
//     var params = {
//       "origin": "${origin.latitude},${origin.longitude}",
//       "destination": "${destination.latitude},${destination.longitude}",
//       "mode": mode,
//       "avoidHighways": "$avoidHighways",
//       "avoidFerries": "$avoidFerries",
//       "avoidTolls": "$avoidTolls",
//       "key": googleApiKey
//     };
//     if (wayPoints.isNotEmpty) {
//       List wayPointsArray = [];
//       for (var point in wayPoints) {
//         wayPointsArray.add(point.location);
//       }
//       String wayPointsString = wayPointsArray.join('|');
//       if (optimizeWaypoints) {
//         wayPointsString = 'optimize:true|$wayPointsString';
//       }
//       params.addAll({"waypoints": wayPointsString});
//     }
//     // Uri uri =
//     //     Uri.https("maps.googleapis.com", "maps/api/directions/json", params);

//     // print('GOOGLE MAPS URL: ' + url);
//     var response = await DioManager.getInstance.get(url: 'http://maps.googleapis.com/maps/api/directions/json', queryParameters: params);
//     if (response.statusCode == 200) {
//       var parsedJson = jsonDecode(response.data);
//       result.status = parsedJson["status"];
//       if (parsedJson["status"]?.toLowerCase() == statusOk &&
//           parsedJson["routes"] != null &&
//           parsedJson["routes"].isNotEmpty) {
//         result.points = decodeEncodedPolyline(
//             parsedJson["routes"][0]["overview_polyline"]["points"]);
//       } else {
//         result.errorMessage = parsedJson["error_message"];
//       }
//     }
//     return result;
//   }

//   List<LatLng> decodeEncodedPolyline(String encoded) {
//     List<LatLng> poly = [];
//     int index = 0, len = encoded.length;
//     int lat = 0, lng = 0;

//     while (index < len) {
//       int b, shift = 0, result = 0;
//       do {
//         b = encoded.codeUnitAt(index++) - 63;
//         result |= (b & 0x1f) << shift;
//         shift += 5;
//       } while (b >= 0x20);
//       int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
//       lat += dlat;

//       shift = 0;
//       result = 0;
//       do {
//         b = encoded.codeUnitAt(index++) - 63;
//         result |= (b & 0x1f) << shift;
//         shift += 5;
//       } while (b >= 0x20);
//       int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
//       lng += dlng;
//       LatLng p =
//           LatLng((lat / 1E5).toDouble(), (lng / 1E5).toDouble());
//       poly.add(p);
//     }
//     return poly;
//   }
// }


