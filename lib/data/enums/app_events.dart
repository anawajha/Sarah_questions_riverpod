enum AppEvents { updateDriverLocation, newOrder, availableOrder, driverArrived, startTrip, endTrip, cancelOrder, cancelOrderAfterApproved  }

extension EventsExtension on AppEvents {
  String get value {
    switch (this) {
      case AppEvents.updateDriverLocation:
        return "client-update-driver-location";
      case AppEvents.newOrder:
        return "client-new-order";
      case AppEvents.availableOrder:
        return "App\\Events\\Driver\\AvailableOrder";
      case AppEvents.driverArrived:
        return "client-App\\Events\\Driver\\DriverArrived";
      case AppEvents.startTrip:
        return "client-App\\Events\\Driver\\StartTrip";
      case AppEvents.endTrip:
        return "App\\Events\\Driver\\EndTrip";
      case AppEvents.cancelOrder:
        return "App\\Events\\Driver\\CancelOrder";
      case AppEvents.cancelOrderAfterApproved:
        return "App\\Events\\Driver\\CancelOrderAfterApproved";
    }
  }
}