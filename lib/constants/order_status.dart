enum OrderStatus {
  IN_PROGRESS,
  DELIVERED,
  DECLINED,
  CONFIRMED,
}

extension OrderStatusTranslation on OrderStatus {
  String get title {
    switch (this) {
      case OrderStatus.IN_PROGRESS:
        return 'orderStatus.inProgress';
      case OrderStatus.DELIVERED:
        return 'orderStatus.delivered';
      case OrderStatus.DECLINED:
        return 'orderStatus.declined';
      case OrderStatus.CONFIRMED:
        return 'orderStatus.confirmed';
    }
  }
}
