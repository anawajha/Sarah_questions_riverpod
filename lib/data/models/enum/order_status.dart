enum OrderStatus {
  newOrder(name: 'new'),
  canceled(name: 'cancel'),
  driverApproved(name: 'driver_approved'),
  clientApproved(name: 'client_approved'),
  driverArrived(name: 'driver_arrived'),
  startOrder(name: 'start_order'),
  confirmStartOrder(name: 'confirm_start_order'),
  endOrder(name: 'end_order'),
  confirmEndOrder(name: 'client_confirm_end_order');

  final String name;
  const OrderStatus({required this.name});
}