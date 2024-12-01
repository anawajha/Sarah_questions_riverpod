enum ListenedChannels { location, orders, orderWithId }

extension ChannelsExtension on ListenedChannels {
  String get value {
    switch (this) {
      case ListenedChannels.location:
        return 'private-location';
      case ListenedChannels.orders:
        return 'private-orders';
      case ListenedChannels.orderWithId:
        return 'private-order-';
    }
  }
}
